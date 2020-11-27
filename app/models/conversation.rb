class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :project
  
  validates_uniqueness_of :project_id
  
  scope :between, -> (project_id) do where(project_id: project_id) end
  
  def self.get(project_id)
    conversation = between(project_id).first
    return conversation if conversation.present?
    # create(sender_id: sender_id, recipient_id: recipient_id)
  end
end
