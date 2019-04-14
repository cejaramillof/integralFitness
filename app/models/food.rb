class Food < ApplicationRecord
  belongs_to :user, optional: true
  has_one :food_day, dependent: :destroy
  attr_reader :kcal
  
  def kcal
    ((self.proteins.to_i * 4 ) + (self.carbohydrates.to_i * 4 ) + (self.fats.to_i * 9 )).round
  end
end
