$ ->
  $('#new_project').on 'hidden', ->
    $(this).find('input[type="text"]').val('').closest('.error').removeClass('error')
    $(this).find('span.help-inline').remove()

  $('#new_project').on 'shown', ->
    $(this).find('form').validate()

@Message =
  clear: ->
    $('.flash').remove()

  show: (msg) ->
    Message.clear()
    $('#flashes').append('<div class="alert flash alert-success fade in">
        <button class="close" data-dismiss="alert">×</button>
        ' + msg + '
      </div>')
