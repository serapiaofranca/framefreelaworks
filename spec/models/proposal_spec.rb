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

  describe 'valid?' do
    it 'successfully' do
      julia = Manager.create!(email: 'julia@manager.com', password: '123456')
      library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros',
                                      requirements: 'Ruby, Raisl,Html, CSS, Javascript',
                                      hourly_rate: 100, expiration_date: '10/05/2022',
                                      start_date: '15/05/2022', end_date: '10/07/2022', manager: julia)

      pablo = Developer.create!(email: 'pablo@developer.com', password: '123456')
      Profile.create!(full_name: 'Pablo Estevez', social_name: 'Paulo',
                      birth_date: '10/05/1992', education: 'Engenharia de Software',
                      skills: 'Ruby, Php, Javascript, CSS, Html, SqlServer',
                      employment_history: 'Nasa Network, 3 anos', developer: pablo)

      proposal = Proposal.create!(motivation: 'Experiência em projetos Rails', hourly_rate: 80,
                                  weekly_available_hours: 20, expected_completion: '01/07/2022',
                                  developer: pablo, project: library_cloud)

      expect(proposal.valid?).to eq(true)
    end

    it 'error, duplicate proposal' do
      julia = Manager.create!(email: 'julia@manager.com', password: '123456')
      library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros',
                                      requirements: 'Ruby, Raisl,Html, CSS, Javascript',
                                      hourly_rate: 100, expiration_date: '10/05/2022',
                                      start_date: '15/05/2022', end_date: '10/07/2022', manager: julia)

      pablo = Developer.create!(email: 'pablo@developer.com', password: '123456')
      Profile.create!(full_name: 'Pablo Estevez', social_name: 'Paulo',
                      birth_date: '10/05/1992', education: 'Engenharia de Software',
                      skills: 'Ruby, Php, Javascript, CSS, Html, SqlServer',
                      employment_history: 'Nasa Network, 3 anos', developer: pablo)

      proposal = Proposal.create!(motivation: 'Experiência em projetos Rails', hourly_rate: 80,
                                  weekly_available_hours: 20, expected_completion: '01/07/2022',
                                  developer: pablo, project: library_cloud)

      proposal_dup = Proposal.new(motivation: 'DUPLICATE PROPOSAL', hourly_rate: 80,
                                  weekly_available_hours: 20, expected_completion: '01/07/2022',
                                  developer: pablo, project: library_cloud)

      expect(proposal_dup.valid?).to eq(false)
    end
  end
end
