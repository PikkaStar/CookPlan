// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "@nathanvda/cocoon"
Rails.start()
Turbolinks.start()
ActiveStorage.start()


import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

document.addEventListener('turbolinks:load', function() {
  $('.test1').mouseover(function(){
    $('.test1').css({'background-color': '#a0d8ef'});
  });

  $('.test1').mouseout(function(){
    $('.test1').css({'background-color': ''});
  });

  $('.about').slideDown(1000);
});

document.addEventListener('turbolinks:load', function() {
  $('.about').slideDown(1000);
});