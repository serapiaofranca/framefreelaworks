class Project < ApplicationRecord 
    belongs_to :manager
    has_many :proposals  

    validates :title, :description, :requirements, :hourly_rate,
                :start_date, :end_date, :expiration_date, presence: true 

    validate :start_date_greater_than_end_date
    validate :start_date_greater_than_now

    private

    def start_date_greater_than_end_date
        if end_date <= start_date 
            errors.add(:end_date, 'deve ser maior que data de início')
        end 
        
    end

    def start_date_greater_than_now
        if start_date < Date.today 
            errors.add(:start_date, 'deve ser maior que data atual')
        end
    end


end
