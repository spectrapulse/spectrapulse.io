const colorScheme = window.matchMedia("(prefers-color-scheme: dark)");
const doc = document.documentElement;

if (colorScheme.matches) {
  doc.setAttribute("data-theme", "dark");
} else {
  doc.setAttribute("data-theme", "light");
}

colorScheme.addEventListener("change", (event) => {
  if (event.matches) {
    doc.setAttribute("data-theme", "dark");
  } else {
    doc.setAttribute("data-theme", "light");
  }
});
