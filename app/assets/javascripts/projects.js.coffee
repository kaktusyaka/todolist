$ ->
  $('#new_project').on 'hidden', ->
    $(this).find('input[type="text"]').val('').closest('.error').removeClass('error')
    $(this).find('span.help-inline').remove()

  $('#new_project').on 'shown', ->
    $(this).find('form').validate()
