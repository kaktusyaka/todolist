class Todolist.Views.NewProject extends Backbone.Marionette.View

  events:
    'submit #new_project': 'createProject'

  render: ->
    $(@el).html(Hogan.compile["projects/new"].render())
    this

  createProject: (event) ->
    event.preventDefault()
    attributes = name: $('#new_project_name').val()
    @collection.create attributes,
      wait: true
      success: ->
        $('#new_project_modal form')[0].reset()
