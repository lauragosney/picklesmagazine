#= require active_admin/base
//= require activeadmin/trumbowyg/plugins/base64/trumbowyg.base64.js
//= require activeadmin/trumbowyg/trumbowyg
//= require activeadmin/trumbowyg_input


$('#editor-dropdown')
.trumbowyg({
    btnsDef: {
        image: {
            dropdown: ['insertImage', 'base64'],
            ico: 'insertImage'
        }
    },

    btns: [
        ['viewHTML'],
        ['formatting'],
        ['strong', 'em', 'del'],
        ['superscript', 'subscript'],
        ['link'],
        ['image'],
        ['justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull'],
        ['unorderedList', 'orderedList'],
        ['horizontalRule'],
        ['removeformat'],
        ['fullscreen']
    ]
});
