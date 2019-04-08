ready = ->
  $('.ckeditor').each ->
    CKEDITOR.replace $(this).attr('id')

$(document).ready(ready)
$(document).on('page:load', ready)
