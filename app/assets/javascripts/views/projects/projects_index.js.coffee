class Todolist.Views.ProjectsIndex extends Backbone.Marionette.View

  events:
    'click .new-project-link': 'showNewProjectForm'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)

  appendAll: ->
    for model in @collection.models
      @appendOne(model)

  appendOne: (model) ->
    view = new Todolist.Views.Project(model: model)
    @$('#list_of_project').after(view.render().el)


  render: ->
    $(@el).html(HoganTemplates['projects/index'].render())
    @appendAll()
    @

  showNewProjectForm: (e) ->
    e.preventDefault()
    new_project_view = new Todolist.Views.NewProject(collection: @collection)
    $(new_project_view.render().el).modal('show')
