//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap/rails/confirm
//= require rails.validations
//= require rails.validations.simple_form
//= require best_in_place
//= require_tree .

$ ->
  $(".best_in_place").best_in_place()

  bg_resize = ->
    $('body').css 'min-height', $(window).height() - 82

  bg_resize()
  $(window).resize ->
    bg_resize()

