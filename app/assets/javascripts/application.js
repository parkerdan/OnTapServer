// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require catpants
//= require_tree .

var listener = (window.Turbolinks) ? "page:change":"DOMContentLoaded";

function change(value){
  $("#selected-color").css("background-color", value);
};

document.addEventListener(listener, function(){


  if (document.getElementById("beer-color") !== null) {

    var selectedColor = ($('#beer-color').data().color);
    if (selectedColor === null) {
      var defaultValue = "#ffcc00";
    } else {
      var defaultValue = selectedColor
    };

    change(defaultValue);

    $('#beer-color').minicolors({
      defaultValue:defaultValue,
      inline:true,
      control:'hue',
      change: change,
      swatches: ['#FFCC00','#FBB123','#DE7C00','#BB5100','#9B3200','#7B1A00','#36080A']
    });

  }



});
