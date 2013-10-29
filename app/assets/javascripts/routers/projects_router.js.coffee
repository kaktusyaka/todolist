class Todolist.Routers.Projects extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new Todolist.Collections.Projects()
    @collection.reset($('#projects_list').data('projects'))

  index: ->
    view = new Todolist.Views.ProjectsIndex(collection: @collection)
    $('#projects_list').html(view.render().el)
