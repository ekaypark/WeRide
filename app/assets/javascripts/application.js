// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require jquery-ui
//= require jquery.timepicker.js
//= require jquery-ui.multidatespicker
//= require owl.carousel.min.js

$(document).on("turbolinks:load", function(){
  $(function(){
    $('.see_dates').on('click', function(e){
      e.preventDefault();
      $("#reservation_bar").css('height', '500px');
      $('.close_reservation_bar').show();
      $("#booking_section").show();
      $(this).hide();
      $('.intro_title').hide();
    });

    $('.close_reservation_bar').on('click', function(e){
      e.preventDefault();
      $("#reservation_bar").css('height', '100px');
      $('.see_dates').show();
      $("#booking_section").hide();
      $(this).hide();
      $('.intro_title').show();
    });
  });

  $(function(){
    $(".owl-carousel").owlCarousel({
      items:1,
      // dots:true,
      // nav:true,
      loop:true,
      autoplay: false,
      autoplayTimeout: 5000,
      autoplayHoverPause: true,
      autoHeight: true
    });
  });

});

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};
