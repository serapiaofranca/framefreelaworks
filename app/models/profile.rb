class Profile < ApplicationRecord
    belongs_to :developer

    has_one_attached :avatar 

    validates :full_name, :social_name, :birth_date, :education, 
        :skills, :employment_history, presence: true

    validate :birth_date_greater_18_years_ago

    private

    def birth_date_greater_18_years_ago
        if birth_date.present? && birth_date > 18.years.ago.to_date 
            errors.add(:birth_date, 'deve ter 18 anos ou mais')
        end         
    end
end
