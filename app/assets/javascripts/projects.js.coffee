$ ->
  $('#new_project_modal').on 'hidden', ->
    $(this).find('input[type="text"]').val('').closest('.error').removeClass('error')
    $(this).find('span.help-inline').remove()

  $('#new_project_modal').on 'shown', ->
    $(this).find('form').validate()
    $(this).find('#project_name').focus()

  Task.init()

  $('.edit-task').removeData('modal').modal
    remote: $(this).attr('url')
    show: false

  $('body').on 'hidden', '.modal', ->
    $(this).removeData 'modal'

  $('#edit-task, #new_project_modal').on 'keypress', (e) ->
    if e.keyCode is 13
      e.preventDefault()
      $(this).find('form').submit()

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
  init: ->
    Task.init_datepicker()
    Task.init_checkboxes()
    Task.sortable()

  init_datepicker: ->
    $(".datepicker").find("input").removeClass("hasDatepicker").removeData("datepicker").unbind()
    $('.datepicker').datepicker
      onClose: (dateText, inst) ->
        $(inst.input).change().focusout()
      changeMonth: true
      changeYear: true
      dateFormat: 'yy-mm-dd'

  init_checkboxes: ->
    $('body').on 'change', '.task_finish', ->
      $.ajax
        url: $(this).attr('data-path')
        data: { task: { finish: $(this).val() } }
        type: 'put'
        dataType: 'script'

  sortable: ->
    $('.tasks-list').sortable
      axis: 'y'
      dropOnEmpty: false
      handle: 'span.handle'
      cursor: 'move'
      items: 'tr'
      opacity: 0.4
      scroll: true
      update: ->
        $.post $(this).data('update-url'), $(this).sortable('serialize')

