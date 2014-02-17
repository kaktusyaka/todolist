class Todolist.Views.ProjectsIndex extends Backbone.View

  events:
    'click .new-project-link': 'showNewProjectForm'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @render, this)

  render: ->
    $(@el).html(HoganTemplates['projects/index'].render(
      projects: @collection
    ))
    this

  showNewProjectForm: (event) ->
    event.preventDefault()
    new_project_view = new Todolist.Views.NewProject(collection: @collection)
    $(new_project_view.render().el).modal('show')
