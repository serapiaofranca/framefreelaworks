require 'rails_helper'

RSpec.describe Project, type: :model do

	describe 'associations' do
	    it { should belong_to(:manager).class_name('Manager') }
	end


	describe 'validations' do
	    it { should validate_presence_of(:title) }
	    it { should validate_presence_of(:description) }
	    it { should validate_presence_of(:requirements) }
	    it { should validate_presence_of(:hourly_rate) }
	    it { should validate_numericality_of(:hourly_rate) }      
	    it { should validate_presence_of(:start_date) }
	    it { should validate_presence_of(:end_date) }
	    it { should validate_presence_of(:expiration_date) }
	end	

	describe '#valid?' do
		context 'should not be valid' do
			it 'start date greater than end date' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        		library = Project.new(title: 'Library', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: 2.days.from_now.to_date, 
                    start_date: 15.days.from_now.to_date ,end_date: 13.days.from_now.to_date,manager: julia)

        		expect(library.valid?).to eq(false)
			end
	
			it 'start date equal end date' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        		library = Project.new(title: 'Library', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: 2.days.from_now.to_date, 
                    start_date: 3.days.from_now.to_date ,end_date: 3.days.from_now.to_date,manager: julia)

        		expect(library.valid?).to eq(false)
			end
		
			it 'start date lesser than exiration date' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
	        	library = Project.new(title: 'Library', description: 'Virtual library', 
	                                 requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
	                        hourly_rate: 100, expiration_date: 2.days.from_now.to_date, 
	                    start_date: 1.days.from_now.to_date ,
	                    end_date: 3.days.from_now.to_date,manager: julia)	        	

        		expect(library.valid?).to eq(false)
			end
			it 'expiration date lesser than date now' do
				cris = Manager.create!(email: 'cris@manager.com', password: '123456')
	        	library = Project.new(title: 'Virtual Library', description: 'Livraria virtual', 
	                                 requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
	                        hourly_rate: 100, expiration_date: 2.day.ago.to_date, 
	                    start_date: 10.days.from_now.to_date ,
	                    end_date: 35.days.from_now.to_date,manager: cris)	        	

        		expect(library.valid?).to eq(false)
			end
		end

		it 'should be valid' do			
			julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        	library = Project.new(title: 'Library', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: 2.days.from_now.to_date, 
                    start_date: 10.days.from_now.to_date ,end_date: 43.days.from_now.to_date,manager: julia)

        	expect(library.valid?).to eq(true)
		end	
		
	end
end
