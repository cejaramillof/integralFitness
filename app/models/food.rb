class Food < ApplicationRecord
  belongs_to :user, optional: true
  has_one :food_day, dependent: :destroy
end
