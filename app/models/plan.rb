class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :guest
  enum activity: [:Alta, :Activa, :Baja, :Sedentaria]
  enum goal: [:Definicion, :Mantenimiento, :Volumen]
  before_save :calculate_mass
  
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
