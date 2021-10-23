class Project < ApplicationRecord 
    belongs_to :manager
    has_many :proposals

    enum situation: {openned: 3, development: 6, production: 9}

    validates :title, :description, :requirements, :hourly_rate,
                :start_date, :end_date, :expiration_date, presence: true 

    validate :start_date_greater_than_end_date
    validate :start_date_lesser_expiration_date
    validate :expiration_date_lesser_than_now, on: :create


    private

    def start_date_greater_than_end_date
        if end_date.present? && end_date <= start_date 
            errors.add(:end_date, 'deve ser maior que data de início')
        end 
        
    end

    def start_date_lesser_expiration_date
        if start_date.present? && start_date < expiration_date 
            errors.add(:start_date, 'deve ser maior que data de propostas')
        end
    end

    def expiration_date_lesser_than_now
        if expiration_date.present? && expiration_date < Date.today 
            errors.add(:expiration_date, 'deve ser maior que data atual')
        end
    end


end
