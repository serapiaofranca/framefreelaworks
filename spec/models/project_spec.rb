require 'rails_helper'

RSpec.describe Project, type: :model do

	describe 'associations' do
	    it { should belong_to(:manager).class_name('Manager') }
			it { should have_many(:proposals).class_name('Proposal') }
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

			it 'start date lesser than now' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        		library = Project.new(title: 'Library', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: 3.days.ago.to_date, 
                    start_date: 1.days.ago.to_date ,end_date: 2.days.from_now.to_date,manager: julia)

        		expect(library.valid?).to eq(false)
			end

			it 'start date equal date now' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        		library = Project.new(title: 'Library', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: Date.today, 
                    start_date: Date.today ,end_date: 2.days.from_now.to_date,manager: julia)

        		expect(library.valid?).to eq(false)
			end

			it 'start date greater than now' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        		library = Project.new(title: 'Library', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: 1.days.from_now.to_date, 
                    start_date: 2.days.from_now.to_date ,end_date: 3.days.from_now.to_date,manager: julia)

        		expect(library.valid?).to eq(true)
			end			

			it 'start date greater than end date' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        		library = Project.new(title: 'Library', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: 1.days.from_now.to_date, 
                    start_date: 4.days.from_now.to_date ,end_date: 2.days.from_now.to_date,manager: julia)

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
	                        hourly_rate: 100, expiration_date: 1.day.ago, 
	                    start_date: 1.days.from_now.to_date ,
	                    end_date: 3.days.from_now.to_date,manager: cris)	        	
        		expect(library.valid?).to eq(false)
			end

			it 'expiration date equal start date' do
				cris = Manager.create!(email: 'cris@manager.com', password: '123456')
	        	library = Project.new(title: 'Virtual Library', description: 'Livraria virtual', 
	                                 requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
	                        hourly_rate: 100, expiration_date: 1.day.from_now.to_date, 
	                    start_date: 1.days.from_now.to_date ,
	                    end_date: 3.days.from_now.to_date,manager: cris)	        	
        		expect(library.valid?).to eq(false)
			end

			it 'expiration date greater than date now' do
				cris = Manager.create!(email: 'cris@manager.com', password: '123456')
	        	library = Project.new(title: 'Virtual Library', description: 'Livraria virtual', 
	                                 requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
	                        hourly_rate: 100, expiration_date: 1.day.from_now.to_date, 
	                    start_date: 2.days.from_now.to_date ,
	                    end_date: 3.days.from_now.to_date,manager: cris)	        	
        		expect(library.valid?).to eq(true)
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
