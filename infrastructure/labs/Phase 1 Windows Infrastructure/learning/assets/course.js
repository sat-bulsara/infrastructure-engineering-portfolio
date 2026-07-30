(() => {
  "use strict";

  const pageKey = `learn-anything:${window.location.pathname}`;
  const persistentFields = [...document.querySelectorAll("[data-persist]")];

  persistentFields.forEach((field, index) => {
    const key = `${pageKey}:field:${field.id || index}`;
    const saved = window.localStorage.getItem(key);

    if (saved !== null) {
      if (field instanceof HTMLInputElement && field.type === "checkbox") {
        field.checked = saved === "true";
      } else {
        field.value = saved;
      }
    }

    const eventName =
      field instanceof HTMLInputElement && field.type === "checkbox"
        ? "change"
        : "input";

    field.addEventListener(eventName, () => {
      const value =
        field instanceof HTMLInputElement && field.type === "checkbox"
          ? String(field.checked)
          : field.value;
      window.localStorage.setItem(key, value);
    });
  });

  document.querySelectorAll("[data-quiz-answer]").forEach((quiz) => {
    const input = quiz.querySelector(".quiz-input");
    const button = quiz.querySelector(".quiz-check");
    const feedback = quiz.querySelector(".quiz-feedback");

    if (!input || !button || !feedback) {
      return;
    }

    const acceptedAnswers = (quiz.dataset.quizAnswer || "")
      .split("|")
      .map((answer) => answer.trim().toLocaleLowerCase())
      .filter(Boolean);

    button.addEventListener("click", () => {
      const answer = input.value.trim().toLocaleLowerCase();
      const isCorrect = acceptedAnswers.includes(answer);

      feedback.classList.toggle("correct", isCorrect);
      feedback.classList.toggle("retry", !isCorrect);
      feedback.textContent = isCorrect
        ? "Correct. Explain why it is correct before moving on."
        : "Not yet. Re-read the goal, then open Hint 1 if needed.";
    });
  });

  document.querySelectorAll("[data-reset-progress]").forEach((button) => {
    button.addEventListener("click", () => {
      Object.keys(window.localStorage)
        .filter((key) => key.startsWith(pageKey))
        .forEach((key) => window.localStorage.removeItem(key));
      window.location.reload();
    });
  });
})();

