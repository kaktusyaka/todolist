class Todolist.Views.Project extends Backbone.View

  template: JST['projects/project']

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    $(@el).html(@template(project: @model))
    this
