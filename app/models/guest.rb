class Guest < ApplicationRecord
  belongs_to :user
  has_many :plans, dependent: :destroy
  validates_presence_of :email, :message => "es necesario"
  validates_uniqueness_of :email, :message => "ya existe"
  #validates_presence_of :gender, :message => "- Genero es necesario"
  validates_inclusion_of :gender, :in => [true, false], :message => "- Genero es necesario"
  attr_reader :age
  
   def age
     (Time.now.to_s(:number).to_i - self.dob.to_time.to_s(:number).to_i)/10e9.to_i
   end  
end
