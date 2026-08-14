(() => {
  "use strict";

  const durationMs = 45 * 60 * 1000;
  const storageKey = "apl1008:final-mock-01:start";
  const display = document.querySelector("[data-timer-display]");
  const startButton = document.querySelector("[data-timer-start]");
  const resetButton = document.querySelector("[data-timer-reset]");
  const state = document.querySelector("[data-timer-state]");
  let intervalId;

  const formatTime = (milliseconds) => {
    const totalSeconds = Math.max(0, Math.ceil(milliseconds / 1000));
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;
    return `${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;
  };

  const render = () => {
    const saved = Number(window.localStorage.getItem(storageKey));

    if (!saved) {
      display.textContent = "45:00";
      state.textContent = "Not started";
      startButton.disabled = false;
      return;
    }

    const remaining = durationMs - (Date.now() - saved);
    display.textContent = formatTime(remaining);
    startButton.disabled = true;

    if (remaining <= 0) {
      state.textContent = "Time finished. Stop making changes and begin scoring.";
      window.clearInterval(intervalId);
      return;
    }

    state.textContent = "Assessment running. The timer cannot be paused.";
  };

  startButton.addEventListener("click", () => {
    if (!window.confirm("Start the 45-minute mock now? It cannot be paused.")) {
      return;
    }

    window.localStorage.setItem(storageKey, String(Date.now()));
    render();
    intervalId = window.setInterval(render, 1000);
  });

  resetButton.addEventListener("click", () => {
    if (!window.confirm("Reset the timer? Use this only to discard this attempt.")) {
      return;
    }

    window.localStorage.removeItem(storageKey);
    window.clearInterval(intervalId);
    render();
  });

  render();
  if (window.localStorage.getItem(storageKey)) {
    intervalId = window.setInterval(render, 1000);
  }
})();

