require 'rails_helper'

describe 'Developer send proposal' do
	it 'view form proposal' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')

		project = Project.create!(title:'Livraria Sao Domingos', 
			description: 'Biblioteca virtual para locação de livros usados', 
			requirements: 'Ruby Rails Html Css Javascript',
			hourly_rate: 100,
			expiration_date: '15/12/2021',
			require_presential_meetings: false,
			manager: julia)
		john = Developer.create!(email: 'john@developer.com', password:'123456')
		Profile.create!(full_name: 'John Travolta', social_name: 'john', 
			birth_date: '10/05/1975', education: 'Engenharia social', 
			skills: 'Ruby, Php, C#, Javascript', employment_history: 'Nasa 3 anos', 
			developer: john )

		visit root_path
		click_on 'Entrar como Desenvolvedor'
		fill_in 'E-mail', with: john.email
		fill_in 'Senha', with: john.password
		click_on 'Entrar'
		click_on project.title

		expect(page).to have_content('Livraria Sao Domingos')

	end
end