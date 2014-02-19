class Todolist.Views.ProjectsIndex extends Backbone.View

  #events:
    #'click .new-project-link': 'showNewProjectForm'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @render, this)

  appendAll: ->
    for model in @collection.models
      @appendOne(model)

  appendOne: (model) ->
    view = new Todolist.Views.Project(model: model)
    @$('#list_of_project').append(view.render().el)


  render: ->
    $(@el).html(HoganTemplates['projects/index'].render())
    @appendAll()
    @

  #showNewProjectForm: (event) ->
    #event.preventDefault()
    #new_project_view = new Todolist.Views.NewProject(collection: @collection)
    #$(new_project_view.render().el).modal('show')
