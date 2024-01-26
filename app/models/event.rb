class Event < ApplicationRecord

  validates :title, presence: true

  enum cooking_number: { japan: 0, usa: 1, china: 2,korea: 3}

end
