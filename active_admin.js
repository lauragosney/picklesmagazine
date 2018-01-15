//= require active_admin/base
//= require activeadmin/trumbowyg/trumbowyg
//= require activeadmin/trumbowyg/plugins/base64/trumbowyg.base64.js

$(document).ready( function() {
  $('.trumbowyg-textarea').each(function () {
    var options = {
      svgPath: '/assets/active_admin-trumbowyg.svg'
    };
    options = $.extend({
      btnsDef: {
        // Create a new dropdown
        image: {
          dropdown: ['insertImage', 'base64'],
          ico: 'insertImage'
        }
      },
      // Redefine the button pane
      btns: [
        ['viewHTML'],
        ['formatting'],
        ['strong', 'em', 'del'],
        ['superscript', 'subscript'],
        ['link'],
        ['image'], // Our fresh created dropdown
        ['justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull'],
        ['unorderedList', 'orderedList'],
        ['horizontalRule'],
        ['removeformat'],
        ['fullscreen']
      ]
    }, options, $(this).data( 'options' ));
    $(this).trumbowyg( options );
  });
});
