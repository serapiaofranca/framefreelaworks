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
	
	describe '#valid?' do
		context 'should not be valid' do
			it 'birth date lesser than eighteen' do
				john = Developer.create!(email: 'john@developer.com', password:'123456')
				profile = Profile.new(full_name: 'John Travolta', social_name: 'john', 
					birth_date: 17.years.ago.to_date, education: 'Engenharia social', 
					skills: 'Ruby, Php, C#, Javascript', employment_history: 'Nasa 3 anos', 
					developer: john )

        		expect(profile.valid?).to eq(false)
			end
		end
		context 'valid' do
			it 'birth date greater or equal than seventeen' do
				john = Developer.create!(email: 'john@developer.com', password:'123456')
				profile = Profile.new(full_name: 'John Travolta', social_name: 'john', 
					birth_date: 18.years.ago.to_date, education: 'Engenharia social', 
					skills: 'Ruby, Php, C#, Javascript', employment_history: 'Nasa 3 anos', 
					developer: john )

        		expect(profile.valid?).to eq(true)
			end
		end
	end
end
