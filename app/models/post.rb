class Post < ApplicationRecord
  acts_as_commentable

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :project
  has_many :comments

  acts_as_taggable_on :participant

  acts_as_commentable
end
