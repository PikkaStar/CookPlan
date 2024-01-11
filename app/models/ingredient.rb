class Ingredient < ApplicationRecord
  belongs_to :recipe

  def self.looks(word)
    @ingredient = Ingredient.where("name LIKE?","%#{word}%")
  end

end
