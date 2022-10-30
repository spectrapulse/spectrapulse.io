const colorScheme = window.matchMedia("(prefers-color-scheme: dark)");
const html = document.documentElement;
let deg = 0;

// Animate page border with rotating linear background
function animateBorder() {
  deg >= 360 ? deg = 0 : deg++; // Future Proofing :)
  html.style.background = `background linear-gradient(${deg}deg, #ff6600, #029afe)`;

  setTimeout(() => {
    requestAnimationFrame(animateBorder);
  }, 1000 / 48); // 48fps
}
animateBorder();

// Detect and set prefered color scheme
if (colorScheme.matches) {
  html.setAttribute("data-theme", "dark");
} else {
  html.setAttribute("data-theme", "light");
}

colorScheme.addEventListener("change", (event) => {
  if (event.matches) {
    html.setAttribute("data-theme", "dark");
  } else {
    html.setAttribute("data-theme", "light");
  }
});
