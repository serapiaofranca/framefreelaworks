require 'rails_helper'

describe 'Developer find project' do
	it 'view menu find' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')
		robert = Manager.create!(email: 'robert@manager.com', password: '123456')
		jose = Manager.create!(email: 'jose@manager.com', password: '123456')		

		project = Project.create!(title:'Livraria Sao Domingos', 
			description: 'Biblioteca virtual para locação de livros usados', 
			requirements: 'Ruby Rails Html Css Javascript',
			hourly_rate: 100,
			expiration_date: '15/12/2021',
			require_presential_meetings: false,
			manager: julia)
		project = Project.create!(title:'Estacionamento Sta Emilia', 
			description: 'Estacoinamento virtual para agendamento de vagas', 
			requirements: 'PHP Laravel Html Css Javascript',
			hourly_rate: 60,
			expiration_date: '12/01/2022',
			require_presential_meetings: false,
			manager: robert)
		project = Project.create!(title:'Ticket Virtual', 
			description: 'Loja virtual para vendas de ingressos', 
			requirements: 'Javascript nodeJS React Html Css',
			hourly_rate: 80,
			expiration_date: '27/12/2021',
			require_presential_meetings: true,
			manager: jose)

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

		expect(page).to have_content('Login efetuado com sucesso')
		expect(page).to have_link('Livraria Sao Domingos')
		expect(page).to have_link('Estacionamento Sta Emilia')
		expect(page).to have_link('Ticket Virtual')
		expect(page).to have_link('Buscar projetos')
	end
end