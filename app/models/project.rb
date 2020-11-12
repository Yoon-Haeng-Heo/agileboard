class Project < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :posts, dependent: :destroy
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :functions

  enum project_status: %i(not_started in_progress complete)
end
