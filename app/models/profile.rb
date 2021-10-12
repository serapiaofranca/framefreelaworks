class Profile < ApplicationRecord
    belongs_to :developer 

    validates :full_name, :social_name, :birth_date, :education, 
        :skills, :employment_history, presence: true 
end
