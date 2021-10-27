# Managers
julia = Manager.create!(email: 'julia@manager.com', password: '123456')
robert = Manager.create!(email: 'robert@manager.com', password: '123456')
jose = Manager.create!(email: 'jose@manager.com', password: '123456')	

# Developers
john = Developer.create!(email: 'john@developer.com', password:'123456')
Profile.create!(full_name: 'John Travos', social_name: 'john', 
	birth_date: '10/05/1975', education: 'Engenharia social', 
	skills: 'Ruby, Php, C#, Javascript', employment_history: 'Nasah 3 anos', 
	developer: john )
emily = Developer.create!(email: 'emily@developer.com', password:'123456')
Profile.create!(full_name: 'Emily Campos', social_name: 'Emily', 
	birth_date: '10/05/1975', education: 'Ciência da Comutação', 
	skills: 'Ruby, Java, Html, CSS, Javascript', employment_history: 'ImBM 2 anos', 
	developer: john )

# Projects
project1 = Project.create!(title:'Livraria Sao Domingos', 
	description: 'Biblioteca virtual para locação de livros usados', 
	requirements: 'Ruby Rails Html Css Javascript',
	hourly_rate: 100,
	expiration_date: '15/12/2021',
	start_date: '25/12/2021',
	end_date: '15/02/2022',
	require_presential_meetings: false,
	manager: julia)
project2 = Project.create!(title:'Estacionamento Sta Emilia', 
	description: 'Estacionamento virtual para agendamento de vagas', 
	requirements: 'PHP Laravel Html Css Javascript',
	hourly_rate: 90,
	expiration_date: '12/01/2022',
	start_date: '25/01/2022',
	end_date: '15/03/2022',
	require_presential_meetings: false,
	manager: robert)
project3 = Project.create!(title:'Ticket Virtual', 
	description: 'Loja virtual para vendas de ingressos', 
	requirements: 'Javascript nodeJS React Html Css',
	hourly_rate: 80,
	expiration_date: '27/12/2021',
	start_date: '31/12/2021',
	end_date: '15/02/2022',
	require_presential_meetings: true,
	manager: jose)

# Proposals
Proposal.create!(motivation: 'Novos desafios em projetos Rails', hourly_rate: 95,
						weekly_available_hours: 20, expected_completion: '10/02/2022', 
						developer: john, project: project1)

Proposal.create!(motivation: 'Experiência em projetos web e banco de dados', hourly_rate: 85,
						weekly_available_hours: 20, expected_completion: '10/03/2022', 
						developer: emily, project: project2)