class Profile < ApplicationRecord
    belongs_to :developer

    has_one_attached :avatar 

    validates :full_name, :social_name, :birth_date, :education, 
        :skills, :employment_history, presence: true

end
