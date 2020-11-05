class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project

  acts_as_taggable_on :participant
end