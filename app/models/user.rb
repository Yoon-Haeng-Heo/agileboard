class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PARAMETERS = %i(name phone user_type)
  
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :comments

  has_many :posts
  enum user_type: [:developer, :customer]

  acts_as_mentionable
end
