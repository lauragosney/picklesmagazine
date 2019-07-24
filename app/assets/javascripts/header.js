$(document).on("ready", function () {

  const headerTag = document.querySelector('header')

  const toggleHeader = function () {
    const pixels = window.pageYOffset
  		if(pixels > 60) {
       	headerTag.classList.add('scrolled')
        headerTag.classList.add('blackHeader')
       } else {
        headerTag.classList.remove('scrolled')
        headerTag.classList.remove('blackHeader')
       }
  }

  const fadeBox = function () {
  const pixels = window.pageYOffset
  const alpha = Math.min(pixels / 1000, 0.5)

  headerTag.style.boxShadow = `0 0 10px rgba(0, 0, 0, ${alpha})`
}


  fadeBox()
  toggleHeader()

  document.addEventListener('scroll', function() {
    fadeBox()
    toggleHeader()
  })

})
