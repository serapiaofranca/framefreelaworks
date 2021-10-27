require 'rails_helper'

RSpec.describe Profile, type: :model do

	describe 'associations' do
	    it { should belong_to(:developer).class_name('Developer') }
	end


	describe 'validations' do
	    it { should validate_presence_of(:full_name) }
	    it { should validate_presence_of(:social_name) }
	    it { should validate_presence_of(:birth_date) }
	    it { should validate_presence_of(:education) }
	    it { should validate_presence_of(:skills) }
	    it { should validate_presence_of(:employment_history) }
	end	

end
