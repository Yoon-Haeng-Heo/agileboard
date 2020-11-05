class Project < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  has_many :user_projects
  has_many :users, through: :user_projects
  enum project_status: %i(not_started in_progress complete)
end
