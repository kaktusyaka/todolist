class Todolist.Views.NewProject extends Backbone.View

  template: JST['projects/new']
  events:
    'submit #new_project': 'createProject'

  render: ->
    $(@el).html(@template())
    this

  createProject: (event) ->
    event.preventDefault()
    attributes = name: $('#new_project_name').val()
    @collection.create attributes,
      wait: true
      success: ->
        $('#new_project_modal form')[0].reset()
