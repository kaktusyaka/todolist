class Todolist.Views.NewProject extends Backbone.Marionette.View

  events:
    'submit #new_project': 'createProject'

  render: ->
    $(@el).html(HoganTemplates["projects/new"].render())
    @

  hide: ->
    alert('s')
    #@el.modal(true).hide()
    #false

  createProject: (e) ->
    e.preventDefault()
    attributes = name: $('#new_project_name').val()
    @collection.create attributes,
      wait: true
      success: ->
        $('#new_project_modal form')[0].reset()
