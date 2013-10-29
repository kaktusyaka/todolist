class Todolist.Views.NewProject extends Backbone.View

  template: JST['projects/new']
  events:
    'submit #new_project': 'createProject'

  render: ->
    $(@el).html(@template())
    this

  createProject: (event) ->
    event.preventDefault()
    @collection.create({ name: $('#new_project_name').val() })
