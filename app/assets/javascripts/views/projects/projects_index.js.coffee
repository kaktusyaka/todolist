class Todolist.Views.ProjectsIndex extends Backbone.View

  template: JST['projects/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(projects: @collection))
    this
