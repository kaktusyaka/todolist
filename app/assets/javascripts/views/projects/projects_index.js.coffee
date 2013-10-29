class Todolist.Views.ProjectsIndex extends Backbone.View

  template: JST['projects/index']

  events:
    'submit #new_project': 'createProject'
    'click .new-project-link': 'showNewProjectForm'

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(projects: @collection))
    this

  createProject: (event) ->
    event.preventDefault()
    @collection.create name: $('#new_project_name').val()

  showNewProjectForm: (event) ->
    event.preventDefault()
    $('#new_project_modal').modal('show')
    this.delegateEvents()


