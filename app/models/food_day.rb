class FoodDay < ApplicationRecord
  belongs_to :food
  belongs_to :plan
  attr_accessor :proteins, :fats, :carbs
  enum moment: [:'Al Despertar', :Desayuno, :'Media Mañana', :Almuerzo, :'Media Tarde', :Cena, :Merienda, :'Pre Entreno', :'Durante Entreno', :'Post Entreno']

  def kcals
    (self.weight.to_i * self.food.kcal.to_i) / 100
  end
  
  def proteins
    (self.weight.to_i * self.food.proteins.to_i) / 100
  end
  
  def fats
    (self.weight.to_i  * self.food.fats.to_i) / 100
  end
  
  def carbs
    (self.weight.to_i  * self.food.carbohydrates.to_i) / 100
  end
  
end
