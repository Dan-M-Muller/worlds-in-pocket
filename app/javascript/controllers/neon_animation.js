const neon = document.querySelector('#neon')

function changeAnimationTime() {
  const animationDuration = Math.random();
  setProperty(animationDuration);
}

setInterval(changeAnimationTime, 1000);

function setProperty(duration) {
  neon.style.setProperty('--animation-time', duration +'s')
}
