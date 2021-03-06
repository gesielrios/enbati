class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, 
         :rememberable, :trackable, :validatable
  
  validates :name, :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :name, uniqueness: true
         
end
