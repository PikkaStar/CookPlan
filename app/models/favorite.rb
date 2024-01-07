class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  # user_idとrecipe_idの組み合わせに一意性
  validates :user_id,uniqueness: {scope: :recipe_id}

end
