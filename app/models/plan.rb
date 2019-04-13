class Plan < ApplicationRecord

  before_save :calculate_mass  
  before_save :set_suggested
  belongs_to :user
  belongs_to :guest
  enum activity: [:Alta, :Activa, :Baja, :Sedentaria]
  enum goal: [:Definicion, :Mantenimiento, :Volumen]
  validate :sum_equals_100
    
  def activity_n
    if self.guest.gender == false
      case activity
        when "Sedentaria"
          1
        when "Baja"
          1.11
        when "Activa"
          1.25
        else
          1.48
      end
    else
      case activity
        when "Sedentaria"
          1
        when "Baja"
          1.12
        when "Activa"
          1.27
        else
          1.45
      end
    end
  end  
  
  def set_suggested
    if self.guest.gender == false
        tdee = 662 - (9.53 * self.guest.age) + activity_n * ((15.91 * self.lean_mass)+(539.6 * (self.guest.height * 0.01)))
    else
        tdee = 354 - (6.91 * self.guest.age) + activity_n * ((9.36 * self.lean_mass)+(726 * (self.guest.height * 0.01)))
    end
    self.kcal = tdee + (tdee * (self.variation / 100.0))
  end
  
  def sum_equals_100
    if self.carbs + self.proteins + self.fats != 100
      errors.add(:base, 'la suma de los 3 macronutrientes debe dar 100%')
    end
  end
  
  def calculate_mass
    if self.guest.gender == true
      self.residual_mass = (self.weight * 0.209).round(2)
    else
      self.residual_mass = (self.weight * 0.241).round(2)
    end
    self.fat_mass = (self.weight * (self.fat / 100)).round(2)
    self.lean_mass = (self.weight - self.fat_mass).round(2)
    self.skeletal_mass = (self.weight * 0.14).round(2)
    self.muscle_mass = (self.weight - (self.fat_mass + self.skeletal_mass + self.residual_mass)).round(2)
  end  
  
end
