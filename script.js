// Get and set prefered colors scheme
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

// Rotate background gradient
let html = document.documentElement;
let deg = 0;

function animateBorder() {
  html.style.background = `background linear-gradient(${deg++}deg, #ff6600, #029afe)`;

  setTimeout(() => {
    requestAnimationFrame(animateBorder)
  }, 1000 / 48) // 48fps
}

animateBorder();
