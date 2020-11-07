class Post < ApplicationRecord
  acts_as_commentable

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :project

  acts_as_taggable_on :participant
end
