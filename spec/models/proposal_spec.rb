require 'rails_helper'

RSpec.describe Proposal, type: :model do

	describe 'associations' do
	    it { should belong_to(:project).class_name('Project') }
	    it { should belong_to(:developer).class_name('Developer') }
	end


	describe 'validations' do
	    it { should validate_presence_of(:motivation) }
	    it { should validate_presence_of(:hourly_rate) }
	    it { should validate_numericality_of(:hourly_rate) } 
	    it { should validate_presence_of(:weekly_available_hours) }
	    it { should validate_presence_of(:expected_completion) }
	end	
  
end
