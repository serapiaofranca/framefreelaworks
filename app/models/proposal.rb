class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :developer

  enum status: {pending: 5, accepted: 10, rejected: 20, canceled: 30}

  validates :motivation, :weekly_available_hours, :hourly_rate, 
                :expected_completion, presence: true
  validates :hourly_rate, numericality: { greater_than: 10 }

  validates :justification, presence: true, on: :update

  validates_uniqueness_of :developer_id, scope: [:developer_id, :project_id ]  

end
