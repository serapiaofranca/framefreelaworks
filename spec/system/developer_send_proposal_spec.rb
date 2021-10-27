require 'rails_helper'

describe 'Developer send proposal' do
	it 'view form proposal in project page' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')

		project = Project.create!(title:'Livraria Sao Domingos', 
			description: 'Biblioteca virtual para locação de livros usados', 
			requirements: 'Ruby Rails Html Css Javascript',
			hourly_rate: 100,
			expiration_date: '15/12/2021',
			start_date: '25/12/2021',
			end_date: '15/02/2022',
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

		expect(page).to have_content('Faça parte desse time de desenvolvedores')
		expect(page).to have_content('Motivação')
		expect(page).to have_content('Remuneração por hora')
		expect(page).to have_content('Horas disponíveis por semana')
		expect(page).to have_content('Expectativa de conclusão')
		expect(page).to have_button('Enviar proposta')
	end

	it 'successfully' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')

		project = Project.create!(title:'Livraria Sao Domingos', 
			description: 'Biblioteca virtual para locação de livros usados', 
			requirements: 'Ruby Rails Html Css Javascript',
			hourly_rate: 100,
			expiration_date: '15/12/2021',
			start_date: '25/12/2021',
			end_date: '15/02/2022',
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
		fill_in 'Motivação', with: 'Portifólio: www.john.com/projects, varios em Ruby on Rails'
		fill_in 'Remuneração por hora', with: (90)
		fill_in 'Horas disponíveis por semana', with: (36)
		fill_in 'Expectativa de conclusão', with: '10/02/2022'
		click_on 'Enviar proposta'

		expect(page).not_to have_link('Enviar proposta')
		expect(page).to have_content('Proposta enviada com sucesso, esperando aprovação')
		expect(page).to have_content('Portifólio: www.john.com/projects, varios em Ruby on Rails')
		expect(page).to have_content('R$ 90,00')
		expect(page).to have_content(/36/)
		expect(page).to have_content('10/02/2022')
		expect(page).to have_link('Voltar')
	end

	it 'developer view owned proposal in project' do 		
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
						developer: pablo, project: library_cloud)

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
		expect(page).to have_content 'Status: pendente'		
		expect(page).not_to have_link 'Enviar proposta'
	end

	it 'error' do
		julia = Manager.create!(email: 'julia@manager.com', password: '123456')

		project = Project.create!(title:'Livraria Sao Domingos', 
			description: 'Biblioteca virtual para locação de livros usados', 
			requirements: 'Ruby Rails Html Css Javascript',
			hourly_rate: 100,
			expiration_date: '15/12/2021',
			start_date: '25/12/2021',
			end_date: '15/02/2022',
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
		click_on 'Enviar proposta'

		expect(page).to have_content(project.title)		
		expect(page).not_to have_content('Proposta enviada com sucesso, esperando aprovação')
		expect(page).to have_content('Motivação não pode ficar em branco')		
		expect(page).to have_content('Horas disponíveis por semana não pode ficar em branco')		
		expect(page).to have_content('Remuneração por hora não pode ficar em branco')		
		expect(page).to have_content('Expectativa de conclusão não pode ficar em branco')		
		expect(page).to have_content('Remuneração por hora não é um número')
		expect(page).to have_content('Faça parte desse time de desenvolvedores')
		expect(page).to have_content('Motivação')
		expect(page).to have_content('Remuneração por hora')
		expect(page).to have_content('Horas disponíveis por semana')
		expect(page).to have_content('Expectativa de conclusão')
		expect(page).to have_button('Enviar proposta')		
	end
end