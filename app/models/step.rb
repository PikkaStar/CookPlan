class Step < ApplicationRecord
  belongs_to :recipe

  has_one_attached :cook_image

    def get_cook_image(width, height)
      if cook_image.attached?
        cook_image.variant(resize: "#{width}x#{height}^", gravity: 'center', crop: "#{width}x#{height}+0+0").processed
      else
        "no_image"
      end
    end

end
