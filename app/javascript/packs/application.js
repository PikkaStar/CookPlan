// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

$(document).on('turbolinks:load', function() {
    // 食材の追加
    $('#add_ingredient').click(function(e) {
      e.preventDefault();
      var ingredientsFields = $('#ingredients_fields');
      var newIngredientField = ingredientsFields.children('.ingredient-fields:first').clone();
      newIngredientField.find('input').val('');
      newIngredientField.appendTo(ingredientsFields);
    });

    // 調理手順の追加
    $('#add_step').click(function(e) {
      e.preventDefault();
      var stepsFields = $('#steps_fields');
      var newStepField = stepsFields.children('.step-fields:first').clone();
      newStepField.find('textarea').val('');
      newStepField.appendTo(stepsFields);
    });

    // 食材・調理手順の削除
    $('#ingredients_fields, #steps_fields').on('click', '.remove-ingredient, .remove-step', function(e) {
      e.preventDefault();
      $(this).closest('.ingredient-fields, .step-fields').remove();
    });
  });