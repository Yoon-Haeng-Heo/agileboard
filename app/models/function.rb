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

    event :progress do
      transitions from: :to_do, to: :in_progress
    end

    event :complete do
      transitions from: :in_progress, to: :complete
    end

    event :feedback do
      transitions from: :complete, to: :feedback
    end

    event :finish do
      transitions from: :feedback, to: :end
    end

  end

  belongs_to :project
end
