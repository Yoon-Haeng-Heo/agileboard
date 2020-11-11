class Function < ApplicationRecord
  acts_as_taggable_on :tags
  acts_as_taggable_on :users
  include AASM

  aasm do
    state :to_do, initial: true
    state :in_progress 
    state :complete
    state :feedback
    state :end
  end

  belongs_to :project
end
