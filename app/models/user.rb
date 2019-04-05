class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_reader :active
  
  def active
    !self.premium.blank? && self.premium >= Time.now.to_date || self.admin
  end
  
  def active_for_authentication?
   super && active || admin
  end         
end
