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
//= require jquery.quicksand

// Custom sorting plugin
(function($) {
  $.fn.sorted = function(customOptions) {
    var options = {
      reversed: false,
      by: function(a) { return a.text(); }
    };
    $.extend(options, customOptions);
    $data = $(this);
    arr = $data.get();
    arr.sort(function(a, b) {
      var valA = options.by($(a));
      var valB = options.by($(b));
      if (options.reversed) {
        return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;				
      } else {		
        return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;	
      }
    });
    return $(arr);
  };
})(jQuery);

// DOMContentLoaded
$(function() {
  
  var $buttons = $('#filter button'),
      $programs = $('#program_offerings');

  // clone applications to get a second collection
  var $data = $programs.clone();

  // attempt to call Quicksand on every button click
  $buttons.click(function(e) {
    var $triggeredButton = $(this);
    $('button.btn-primary').removeClass('btn-primary');
    $triggeredButton.addClass('btn-primary');
    
    if ($triggeredButton.val() == 'all') {
      var $filteredData = $data.find('li');
    } else {
      var $filteredData = $data.find('li[data-type*=' + $triggeredButton.val() + ']');
    }

    // sort by name
    var $sortedData = $filteredData.sorted({
      by: function(v) {
        return $(v).find('p').text().toLowerCase();
      }
    });

    // finally, call quicksand
    $programs.quicksand($sortedData, {
      duration: 800,
      easing: 'easeInOutQuad'
    });

  }).filter(':first').click();

});