class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_repaiers
  has_many :repaiers, through: :user_repairs
  has_many :parts, through: :user_parts
  has_many :user_repaiers
  has_many :user_parts
end
