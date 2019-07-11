$(document).on("ready", function () {

  const headerTag = document.querySelector('header')
  const headerBlack = document.querySelector('.header_black_hide')

  const toggleHeader = function () {
    const pixels = window.pageYOffset
  		if(pixels > 60) {
       		headerTag.classList.add('scrolled')
          headerBlack.classList.add('header_black_visible')
       } else {
         headerTag.classList.remove('scrolled')
         headerBlack.classList.remove('header_black_visible')
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
