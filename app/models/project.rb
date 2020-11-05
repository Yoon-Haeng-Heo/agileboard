class Project < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  enum project_status: %i(not_started in_progress complete)
end
