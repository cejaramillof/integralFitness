class Exercise < ApplicationRecord
  MUSCLES = [:Hombros, :Biceps, :Antebrazos, :Pectorales, :Abdominales, :Triceps, :Trapecios, :Dorsales, :Cuadriceps, :Abductores, :Aductores, :Gluteos, :Isquiotibiales, :Pantorrillas, :FullBody, :Cardio, :Estiramiento, :Rotadores]
  enum gruppo1: MUSCLES, _suffix: true
  enum gruppo2: MUSCLES
  has_one :exercise_day 
end
