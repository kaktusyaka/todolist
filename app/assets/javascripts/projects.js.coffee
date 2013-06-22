$ ->
  $('#new_project').on 'hidden', ->
    $(this).find('input[type="text"]').val('')
