class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :recipes,dependent: :destroy
         has_many :favorites,dependent: :destroy

         has_one_attached :profile_image

         validates :name,presence: true
         validates :introduction,length: { maximum: 200 }

        # サイズ変更
        def get_profile_image(width, height)
          if profile_image.attached?
            profile_image.variant(resize: "#{width}x#{height}^", gravity: 'center', crop: "#{width}x#{height}+0+0").processed
          else
            "no_image"
          end
        end

end
