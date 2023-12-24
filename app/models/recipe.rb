class Recipe < ApplicationRecord

# gem:acts_as_taggableの使用
   acts_as_taggable_on :tags

   validates :dish_name,presence: true
   validates :recipe,presence: true

   belongs_to :user
   has_many :steps,dependent: :destroy
   has_many :ingredients,dependent: :destroy

   has_one_attached :image

    def get_image(width, height)
      if image.attached?
        image.variant(resize: "#{width}x#{height}^", gravity: 'center', crop: "#{width}x#{height}+0+0").processed
      else
        "no_image"
      end
    end

end
