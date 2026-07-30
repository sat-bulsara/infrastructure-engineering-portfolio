(() => {
  "use strict";

  const storage = {
    get(key) {
      try {
        return window.localStorage.getItem(key);
      } catch {
        return null;
      }
    },
    set(key, value) {
      try {
        window.localStorage.setItem(key, value);
      } catch {
        // The lab still works when browser storage is unavailable.
      }
    },
    remove(key) {
      try {
        window.localStorage.removeItem(key);
      } catch {
        // Nothing else is required.
      }
    },
  };

  const copyText = async (text, editor) => {
    try {
      await navigator.clipboard.writeText(text);
      return true;
    } catch {
      editor.focus();
      editor.select();
      return document.execCommand("copy");
    }
  };

  const downloadCode = (code, filename) => {
    const url = URL.createObjectURL(
      new Blob([code], { type: "text/plain;charset=utf-8" })
    );
    const link = document.createElement("a");
    link.href = url;
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    link.remove();
    window.setTimeout(() => URL.revokeObjectURL(url), 1000);
  };

  const exportCode = async (code, config, labId) => {
    const filename = config.exportFileName || `${labId}.txt`;

    if (typeof window.showSaveFilePicker === "function") {
      const extension = filename.includes(".")
        ? `.${filename.split(".").pop()}`
        : ".txt";
      const pickerPromise = window.showSaveFilePicker({
        id: config.exportPickerId || "learn-anything-code",
        suggestedName: filename,
        types: [
          {
            description: config.exportDescription || "Code file",
            accept: {
              "text/plain": [extension],
            },
          },
        ],
      });
      const handle = await pickerPromise;
      const writable = await handle.createWritable();
      await writable.write(code);
      await writable.close();
      return { kind: "saved", filename: handle.name || filename };
    }

    downloadCode(code, filename);
    return { kind: "downloaded", filename };
  };

  document.querySelectorAll(".code-lab[data-lab-id]").forEach((lab) => {
    const editor = lab.querySelector(".code-editor");
    const runButton = lab.querySelector(".code-run");
    const copyButton = lab.querySelector(".code-copy");
    const exportButton = lab.querySelector(".code-export");
    const resetButton = lab.querySelector(".code-reset");
    const testsList = lab.querySelector(".code-tests");
    const output = lab.querySelector(".code-output");
    const status = lab.querySelector(".lab-status");
    const configElement = lab.querySelector(".code-lab-config");

    if (
      !editor ||
      !runButton ||
      !copyButton ||
      !exportButton ||
      !resetButton ||
      !testsList ||
      !output ||
      !status ||
      !configElement
    ) {
      return;
    }

    let config;
    try {
      config = JSON.parse(configElement.textContent);
    } catch {
      status.textContent = "Lab unavailable";
      output.textContent = "The exercise configuration could not be read.";
      runButton.disabled = true;
      return;
    }

    const labId = lab.dataset.labId;
    const storageKey = `learn-anything:${window.location.pathname}:lab:${labId}`;
    const exportKey = `${storageKey}:exported-code`;
    const starterCode = editor.value;
    const savedCode = storage.get(storageKey);

    if (savedCode !== null) {
      editor.value = savedCode;
    }

    const setStatus = (message, state) => {
      status.textContent = message;
      status.dataset.state = state;
    };

    const saveCode = async () => {
      try {
        setStatus("Choose save location", "edited");
        const result = await exportCode(editor.value, config, labId);
        storage.set(exportKey, editor.value);
        setStatus(
          result.kind === "saved" ? "Saved to repo" : "File downloaded",
          "passed"
        );
        output.textContent +=
          result.kind === "saved"
            ? `\n\nEXPORTED\nSaved ${result.filename}. Run that file in PowerShell for real verification.`
            : `\n\nDOWNLOADED\nDownloaded ${result.filename}. Move it into the repository, then run it in PowerShell.`;
      } catch (error) {
        if (error && error.name === "AbortError") {
          setStatus("Checks passed", "passed");
          return;
        }
        setStatus("Export needs attention", "retry");
        output.textContent +=
          "\n\nEXPORT NOT COMPLETED\nUse Copy code or try Save to repo again.";
      }
    };

    const runChecks = async () => {
      const code = editor.value;
      const tests = Array.isArray(config.tests) ? config.tests : [];
      const results = tests.map((test) => {
        let passed = true;
        try {
          if (test.pattern) {
            passed =
              passed &&
              new RegExp(test.pattern, test.flags || "im").test(code);
          }
          if (test.notPattern) {
            passed =
              passed &&
              !new RegExp(test.notPattern, test.flags || "im").test(code);
          }
        } catch {
          passed = false;
        }
        return { label: test.label || "Exercise requirement", passed };
      });

      testsList.replaceChildren();
      results.forEach((result) => {
        const item = document.createElement("li");
        item.className = result.passed ? "code-test-pass" : "code-test-retry";
        item.textContent = `${result.passed ? "PASS" : "RETRY"} — ${result.label}`;
        testsList.appendChild(item);
      });

      const passedAll = results.length > 0 && results.every((result) => result.passed);
      if (passedAll) {
        setStatus("Checks passed", "passed");
        output.textContent =
          config.successOutput ||
          "Checks passed. Run the matching file in the real runtime next.";
        output.dataset.state = "passed";
        exportButton.disabled = false;
        if (
          config.autoExport === true &&
          storage.get(exportKey) !== editor.value
        ) {
          await saveCode();
        }
      } else {
        const firstFailure = results.find((result) => !result.passed);
        setStatus("Keep going", "retry");
        output.textContent = firstFailure
          ? `No simulated output yet. First fix: ${firstFailure.label}`
          : "No checks are configured for this exercise.";
        output.dataset.state = "retry";
        exportButton.disabled = true;
      }
    };

    editor.addEventListener("input", () => {
      storage.set(storageKey, editor.value);
      setStatus("Edited", "edited");
    });

    editor.addEventListener("keydown", (event) => {
      if ((event.ctrlKey || event.metaKey) && event.key === "Enter") {
        event.preventDefault();
        void runChecks();
        return;
      }

      if (event.key === "Tab") {
        event.preventDefault();
        const start = editor.selectionStart;
        const end = editor.selectionEnd;
        editor.setRangeText("    ", start, end, "end");
        storage.set(storageKey, editor.value);
      }
    });

    runButton.addEventListener("click", () => {
      void runChecks();
    });

    exportButton.addEventListener("click", () => {
      void saveCode();
    });

    copyButton.addEventListener("click", async () => {
      const copied = await copyText(editor.value, editor);
      copyButton.textContent = copied ? "Copied" : "Select and copy";
      window.setTimeout(() => {
        copyButton.textContent = "Copy code";
      }, 1600);
    });

    resetButton.addEventListener("click", () => {
      if (!window.confirm("Reset this editor to its starter code?")) {
        return;
      }
      editor.value = starterCode;
      storage.remove(storageKey);
      testsList.replaceChildren();
      output.textContent = "Run checks to see simulated output.";
      output.dataset.state = "";
      exportButton.disabled = true;
      setStatus("Not run", "idle");
      editor.focus();
    });
  });
})();
