$(document).on("ready", function () {

  $('.delivery_address').hide();

  $("#order_subscribe").on("click", function(e) {
     var checked = $(this).is(":checked");
     if (checked) {
       $('.delivery_address').hide(200);
     } else {
       $('.delivery_address').show(200);
     }
  });

  $(document).on("scroll", function () {
    var pageTop = $(document).scrollTop()
    var pageBottom = pageTop + $(window).height()
    var tags = $("section")

    for (var i = 0; i < tags.length; i++) {
      var tag = tags[i]

      if ($(tag).position().top < pageBottom) {
        $(tag).addClass("visible")

      } else {
        $(tag).removeClass("visible")
      }


    if (pageTop > 200) {
        $(".hero").addClass("fade")
    } else
    	$(".hero").removeClass("fade")
    }
  })


  $('div.menu-toggle').on("click", function () {
    $('.menu').toggleClass('open')
    $(this).toggleClass('open')
  })

  $(".homehover").hover(function () {
    $("div.navigation-overlay-bg-home-hover").fadeIn()
  }, function () {
    $("div.navigation-overlay-bg-home-hover").fadeOut()
  })

  $(".shophover").hover(function () {
    $("div.navigation-overlay-bg-shop-hover").fadeIn()
  }, function () {
    $("div.navigation-overlay-bg-shop-hover").fadeOut()
  })

  $(".storieshover").hover(function () {
    $("div.navigation-overlay-bg-stories-hover").fadeIn()
  }, function () {
    $("div.navigation-overlay-bg-stories-hover").fadeOut()
  })

  $(".abouthover").hover(function () {
    $("div.navigation-overlay-bg-about-hover").fadeIn()
  }, function () {
    $("div.navigation-overlay-bg-about-hover").fadeOut()
  })

  $(".contacthover").hover(function () {
    $("div.navigation-overlay-bg-contact-hover").fadeIn()
  }, function () {
    $("div.navigation-overlay-bg-contact-hover").fadeOut()
  })

  $("form.newsletter").on("ajax:success", function (ev, data, status, xhr) {
    $(this).html(event.detail[0])
  }).on("ajax:error", function (e, xhr, status, error) {
    alert("Please complete all required fields")
  })
})
