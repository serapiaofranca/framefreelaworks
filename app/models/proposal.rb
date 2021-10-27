class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :developer

  enum status: {pending: 5, accepted: 10, rejected: 20, canceled: 30}

  validates :motivation, :hourly_rate, :weekly_available_hours, 
                :expected_completion, presence: true

  validates :justification, presence: true, on: :update

end
