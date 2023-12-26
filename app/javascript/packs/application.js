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
  var ingredientCount = 1; // 最初の食材の番号
  var stepCount = 1; // 最初の調理手順の番号

  // 食材の追加
  $('#add_ingredient').click(function(e) {
    e.preventDefault();
    var ingredientsFields = $('#ingredients_fields');
    var newIngredientField = ingredientsFields.children('.ingredient-fields:first').clone();

    // 新しい食材の番号を挿入
    var newIngredientCount = ++ingredientCount;
    newIngredientField.find('label[for*="name"]').text("食材 " + newIngredientCount);
    newIngredientField.find('label[for*="quantity"]').text("用量 " + newIngredientCount);

    // 入力欄をクリア
    newIngredientField.find('input').val('');

    // 削除ボタンを非表示にする（最初の食材以外は表示）
    newIngredientField.find('.remove-ingredient').toggle(newIngredientCount > 1);

    newIngredientField.appendTo(ingredientsFields);
  });

  // 調理手順の追加
  $('#add_step').click(function(e) {
    e.preventDefault();
    var stepsFields = $('#steps_fields');
    var newStepField = stepsFields.children('.step-fields:first').clone();

    // 新しい調理手順の番号を挿入
    newStepField.find('label').text("調理手順 " + (++stepCount));

    // テキストエリアをクリア
    newStepField.find('textarea').val('');

    // 削除ボタンを非表示にする（最初の調理手順以外は表示）
    newStepField.find('.remove-step').toggle(stepCount > 1);

    newStepField.appendTo(stepsFields);
  });

  // 食材・調理手順の削除
  $('#ingredients_fields, #steps_fields').on('click', '.remove-ingredient, .remove-step', function(e) {
    e.preventDefault();

    var removedElement = $(this).closest('.ingredient-fields, .step-fields');

    // 最初の要素に対しては削除ボタンの非表示を維持
    if (removedElement.index('.ingredient-fields, .step-fields') !== 0) {
      removedElement.prev().find('.remove-ingredient, .remove-step').show();
    }

    removedElement.remove();
  });
});