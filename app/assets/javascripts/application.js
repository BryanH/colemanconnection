// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require modernizr
//= require jquery
//= require jquery_ujs
//= require jquery.easing
//= require jquery.tour.min
//= require jquery.scrollTo.min
//= require jquery.content_player
//= require jquery.jwerty
//
//= require bootstrap
//= require extensions/bootstrap/bootstrap-affix
//= require jquery.twitter_bootstrap_confirm
//
//= require plugins/logger
//= require plugins/affixable
//
//= require pages/sessions/new
//= require pages/attendance
//= require pages/employee/permissions
//= require pages/employee/select_toggle
//= require pages/employee/keyboard_shortcuts
//= require pages/candidate/program_session
//= require_tree ./pages/tours
//
//= require quiz/base

jQuery(document).ready(function () {
  jQuery('[rel="popover"]').popover();
  jQuery('.collapse-toggle').click(function (e) {e.preventDefault();});
});