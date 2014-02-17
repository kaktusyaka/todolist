//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap/rails/confirm
//= require underscore
//= require backbone
//= require backbone.marionette
//= require hogan
//= require todolist
//= require_tree ../templates
//= require_tree .

$ ->
  bg_resize = ->
    $('body').animate({'min-height': $(window).height() - 82}, 1000)

  bg_resize()
  $(window).resize ->
    bg_resize()

