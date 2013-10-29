class Todolist.Views.ProjectsIndex extends Backbone.View

  template: JST['projects/index']

  events:
    'click .new-project-link': 'showNewProjectForm'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @render, this)

  render: ->
    $(@el).html(@template(projects: @collection))
    this

  showNewProjectForm: (event) ->
    event.preventDefault()
    new_project_view = new Todolist.Views.NewProject(collection: @collection)
    $(new_project_view.render().el).modal('show')
