$(document).on("ready turbolinks:load", function () {

    $('.delivery_address').hide();

    $("#order_subscribe").on("click", function(e) {
       var checked = $(this).is(":checked");
       if (checked) {
         $('.delivery_address').hide(300);
       } else {
         $('.delivery_address').show(300);
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

    $('div.menu-toggle').on('click',function(){
      $('.menu').toggleClass('open')

    })
    $("div.menu-toggle").on("click", function () {

      if ($("img.icon").attr("src") == "menu-icon.svg") {
         $("img.icon").attr("src", "menu-close.svg")
      } else {
         $("img.icon").attr("src", "menu-icon.svg")
      }
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
      $(this).html(xhr.responseText)
    }).on("ajax:error", function (e, xhr, status, error) {
      alert("Please complete all required fields")
    })

})
