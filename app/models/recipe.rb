class Recipe < ApplicationRecord

# gem:acts_as_taggableの使用
   acts_as_taggable_on :tags

   validates :title,presence: true
   validates :introduction,presence: true

   belongs_to :user
   has_many :favorites,dependent: :destroy
   has_many :steps,dependent: :destroy
   has_many :ingredients,dependent: :destroy
#   子モデルのカラムを許可
   accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
   accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank

   has_one_attached :image

    def get_image(width, height)
      if image.attached?
        image.variant(resize: "#{width}x#{height}^", gravity: 'center', crop: "#{width}x#{height}+0+0").processed
      else
        "no_image"
      end
    end

    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end

end
