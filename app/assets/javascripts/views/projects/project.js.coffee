class Todolist.Views.Project extends Backbone.Marionette.View

  render: ->
    $(@el).html(HoganTemplates['projects/_project'].render(@model.toJSON()))
    @
