class FoodDay < ApplicationRecord
  belongs_to :food
  belongs_to :plan
  enum moment: [:'Al despertar', :Desayuno, :'Media Mañana', :Almuerzo, :'Media Tarde', :Cena, :Merienda, :'Pre Entreno', :'Durante Entreno', :'Post Entreno']
end
