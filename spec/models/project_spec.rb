require 'rails_helper'

RSpec.describe Project, type: :model do

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
	
			it 'start date equal date' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        		library = Project.new(title: 'Library', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: 2.days.from_now.to_date, 
                    start_date: 15.days.from_now.to_date ,end_date: 15.days.from_now.to_date,manager: julia)

        		expect(library.valid?).to eq(false)
			end
		
			it 'start date in the pass' do
				julia = Manager.create!(email: 'julia@manager.com', password: '123456')
	        	library = Project.new(title: 'Library', description: 'Virtual library', 
	                                 requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
	                        hourly_rate: 100, expiration_date: 2.days.from_now.to_date, 
	                    start_date: 10.days.ago.to_date ,
	                    end_date: 35.days.from_now.to_date,manager: julia)
	        	

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
