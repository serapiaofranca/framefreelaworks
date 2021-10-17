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
			start_date: '25/12/2021',
			end_date: '15/02/2022',
			require_presential_meetings: false,
			manager: julia)
		project = Project.create!(title:'Estacionamento Sta Emilia', 
			description: 'Estacoinamento virtual para agendamento de vagas', 
			requirements: 'PHP Laravel Html Css Javascript',
			hourly_rate: 60,
			expiration_date: '12/01/2022',
			start_date: '25/01/2022',
			end_date: '15/03/2022',
			require_presential_meetings: false,
			manager: robert)
		project = Project.create!(title:'Ticket Virtual', 
			description: 'Loja virtual para vendas de ingressos', 
			requirements: 'Javascript nodeJS React Html Css',
			hourly_rate: 80,
			expiration_date: '27/12/2021',
			start_date: '31/12/2021',
			end_date: '15/02/2022',
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
		expect(page).to have_content('Pesquisar projetos')
		expect(page).to have_button('Buscar')
	end

	it 'find success' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')
		robert = Manager.create!(email: 'robert@manager.com', password: '123456')
		jose = Manager.create!(email: 'jose@manager.com', password: '123456')		

		project = Project.create!(title:'Livraria Sao Domingos', 
			description: 'Biblioteca virtual para locação de livros usados', 
			requirements: 'Ruby Rails Html Css Javascript',
			hourly_rate: 100,
			expiration_date: '15/12/2021',
			start_date: '25/12/2021',
			end_date: '15/02/2022',
			require_presential_meetings: false,
			manager: julia)
		project = Project.create!(title:'Estacionamento Sta Emilia', 
			description: 'Estacoinamento virtual para agendamento de vagas', 
			requirements: 'PHP Laravel Html Css Javascript',
			hourly_rate: 60,
			expiration_date: '12/01/2022',
			start_date: '25/01/2022',
			end_date: '15/03/2022',
			require_presential_meetings: false,
			manager: robert)
		project = Project.create!(title:'Ticket Virtual', 
			description: 'Loja virtual para vendas de ingressos', 
			requirements: 'Javascript nodeJS React Html Css',
			hourly_rate: 80,
			expiration_date: '27/12/2021',
			start_date: '31/12/2021',
			end_date: '15/02/2022',
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
		fill_in 'Pesquisar projetos', with: 'Livraria'
		click_on 'Buscar'

		expect(page).to have_link('Livraria Sao Domingos')
		expect(page).not_to have_link('Estacionamento Sta Emilia')
		expect(page).not_to have_link('Ticket Virtual')
		expect(page).not_to have_content('Pesquisar projetos')
		expect(page).to have_link('Voltar')		
	end

	it 'no exists projects' do
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

		expect(page).to have_content('Nenhum projeto disponível')
		expect(page).not_to have_content('Pesquisar projetos')
		expect(page).not_to have_link('Buscar')
		expect(page).to have_link('Ver perfil')
		expect(page).to have_content('john@developer.com')
		expect(page).to have_link('Sair')
	end
end