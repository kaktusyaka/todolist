$ ->
  $('#new_project').on 'hidden', ->
    $(this).find('input[type="text"]').val('').closest('.error').removeClass('error')
    $(this).find('span.help-inline').remove()

  $('#new_project').on 'shown', ->
    $(this).find('form').validate()
    $(this).find('#project_name').focus()

  $('#new_project #project_name').on 'keydown', (e) ->
    $(this).closest('form').submit() if e.keyCode == 13

  Task.init_datetimepicker()

@Message =
  clear: ->
    $('.flash').remove()

  show: (msg) ->
    Message.clear()
    $('#flashes').append('<div class="alert flash alert-success fade in">
        <button class="close" data-dismiss="alert">×</button>
        ' + msg + '
      </div>')

@Task =
  init_datetimepicker: ->
    $('.datepicker').datepicker
      onClose: (dateText, inst) ->
        $(inst.input).change().focusout()
      changeMonth: true
      changeYear: true
      dateFormat: 'yy-mm-dd'

