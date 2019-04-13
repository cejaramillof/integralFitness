class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_reader :active
  attr_reader :months
  has_many :guests, dependent: :destroy
  has_many :plans
  has_many :foods, dependent: :destroy
  
  def active
    !self.premium.blank? && self.premium >= Time.now.to_date || self.admin
  end
  
  def active_for_authentication?
    super && active || admin
  end         
end
