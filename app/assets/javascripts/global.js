$(document).on("ready page:load", function () {

    $('.delivery_address').hide();

    $("#order_subscribe").on("click", function(e) {
       var checked = $(this).is(":checked");
       if (checked) {
         $('.delivery_address').hide(300);
       } else {
         $('.delivery_address').show(300);
       }
    });
})
