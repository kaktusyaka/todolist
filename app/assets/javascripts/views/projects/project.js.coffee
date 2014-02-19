class Todolist.Views.Project extends Backbone.View

  render: ->
    $(@el).html(HoganTemplates['projects/_project'].render(@model.toJSON()))
    @
