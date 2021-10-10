class Project < ApplicationRecord
    belongs_to :manager    
    
    validates :title, :description, :requirements, :hourly_rate, 
        :expiration_date, presence: true
end
