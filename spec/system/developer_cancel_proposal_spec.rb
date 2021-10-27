require 'rails_helper'

describe 'Developer cancel proposal' do

	it 'view menu cancel if proposal accepted' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: '10/05/2022', 
                    start_date: '15/05/2022',end_date: '10/07/2022',manager: julia)

        pablo = Developer.create!(email: 'pablo@developer.com', password:'123456')
		Profile.create!(full_name: 'Pablo Estevez', social_name: 'Paulo', 
			birth_date: '10/05/1992', education: 'Engenharia de Software', 
			skills: 'Ruby, Php, Javascript, CSS, Html, SqlServer', 
			employment_history: 'Nasa Network, 3 anos', developer: pablo )		

		Proposal.create!(motivation: 'Experiência em projetos Rails', hourly_rate: 80,
						weekly_available_hours: 20, expected_completion: '01/07/2022', 
						developer: pablo, project: library_cloud, status: 'accepted')

		visit root_path
		click_on 'Entrar como Desenvolvedor'
		fill_in 'E-mail', with: pablo.email
		fill_in 'Senha', with: pablo.password
		click_on 'Entrar'		
		click_on 'Library cloud'

		expect(current_path).to eq project_path(library_cloud)		
		expect(page).to have_content 'Proposta de: Paulo'
		expect(page).to have_content 'R$ 80,00'
		expect(page).to have_content /20/
		expect(page).to have_content '01/07/2022'
		expect(page).to have_content 'Status: aprovado'		
		expect(page).to have_button 'Cancelar proposta'		
		
	end

	it 'developer cancel proposal accepted less three of days' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: '10/05/2022', 
                    start_date: '15/05/2022',end_date: '10/07/2022',manager: julia)

        pablo = Developer.create!(email: 'pablo@developer.com', password:'123456')
		Profile.create!(full_name: 'Pablo Estevez', social_name: 'Paulo', 
			birth_date: '10/05/1992', education: 'Engenharia de Software', 
			skills: 'Ruby, Php, Javascript, CSS, Html, SqlServer', 
			employment_history: 'Nasa Network, 3 anos', developer: pablo )		

		Proposal.create!(motivation: 'Experiência em projetos Rails', hourly_rate: 80,
						weekly_available_hours: 20, expected_completion: '01/07/2022', 
						developer: pablo, project: library_cloud, status: 'accepted')

		visit root_path
		click_on 'Entrar como Desenvolvedor'
		fill_in 'E-mail', with: pablo.email
		fill_in 'Senha', with: pablo.password
		click_on 'Entrar'		
		click_on 'Library cloud'
		fill_in :justification, with: 'Fui contratado via CLT'
		click_on 'Cancelar proposta'


		expect(current_path).to eq project_path(library_cloud)		
		expect(page).to have_content 'Proposta de: Paulo'
		expect(page).to have_content 'R$ 80,00'
		expect(page).to have_content /20/
		expect(page).to have_content '01/07/2022'
		expect(page).to have_content 'Status: cancelado'		
		expect(page).not_to have_button 'Cancelar proposta'
	end	

	it 'error on developer cancel proposal' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: '10/05/2022', 
                    start_date: '15/05/2022',end_date: '10/07/2022',manager: julia)

        pablo = Developer.create!(email: 'pablo@developer.com', password:'123456')
		Profile.create!(full_name: 'Pablo Estevez', social_name: 'Paulo', 
			birth_date: '10/05/1992', education: 'Engenharia de Software', 
			skills: 'Ruby, Php, Javascript, CSS, Html, SqlServer', 
			employment_history: 'Nasa Network, 3 anos', developer: pablo )		

		Proposal.create!(motivation: 'Experiência em projetos Rails', hourly_rate: 80,
						weekly_available_hours: 20, expected_completion: '01/07/2022', 
						developer: pablo, project: library_cloud, status: 'accepted')

		visit root_path
		click_on 'Entrar como Desenvolvedor'
		fill_in 'E-mail', with: pablo.email
		fill_in 'Senha', with: pablo.password
		click_on 'Entrar'		
		click_on 'Library cloud'
		click_on 'Cancelar proposta'


		expect(page).to have_content 'Mensagem não pode ficar em branco'
		expect(page).to have_content 'Proposta de: Paulo'
		expect(page).to have_content 'R$ 80,00'
		expect(page).to have_content /20/
		expect(page).to have_content '01/07/2022'
		expect(page).to have_content 'Status: aprovado'
		expect(page).to have_link 'Voltar'
	end	
end