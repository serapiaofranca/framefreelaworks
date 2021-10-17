class Developer < ApplicationRecord
  has_one :profile
  has_many :proposals
  has_many :projects, through: :proposals
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
