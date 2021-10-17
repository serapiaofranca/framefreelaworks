class Project < ApplicationRecord 
    belongs_to :manager
    has_many :proposals  

    validates :title, :description, :requirements, :hourly_rate, 
        :expiration_date, presence: true    
end
