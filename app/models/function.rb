class Function < ApplicationRecord
  include AASM
  # acts_as_list

  acts_as_taggable_on :tags
  acts_as_taggable_on :users

  belongs_to :project

  aasm do
    state :to_do, initial: true
    state :in_progress 
    state :complete
    state :feedback
    state :end

    event :progress  do
      transitions from: :to_do, to: :in_progress, success: :set_progress_date
    end

    event :complete do
      transitions from: :in_progress, to: :complete, success: :set_complete_date
    end

    event :feedback do
      transitions from: :complete, to: :feedback, success: :set_feedback_date
    end

    event :finish do
      transitions from: :feedback, to: :end, success: :set_finish_date
    end
  end
  private 

  def set_progress_date
    update in_progress_updated_at: Time.zone.now
  end

  def set_complete_date
    update complete_updated_at: Time.zone.now
  end

  def set_feedback_date
    update feedback_updated_at: Time.zone.now
  end

  def set_finish_date
    update end_updated_at: Time.zone.now
  end
  
end
