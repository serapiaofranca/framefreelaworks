manager = Manager.create!(email: 'user@manager.com', password: '123456')

Project.create!(title: 'Library', description: 'Virtual library', 
               requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
               hourly_rate: 100, expiration_date: 200.days.from_now.to_date, 
               start_date: 215.days.from_now.to_date ,end_date: 265.days.from_now.to_date,manager: manager)

Project.create!(title:'Livraria Sao Domingos', 
			description: 'Biblioteca virtual para locação de livros usados', 
			requirements: 'Php laravel Html Css Javascript',
			hourly_rate: 100,
			expiration_date: 210.days.from_now.to_date,
			start_date: 215.days.from_now.to_date,
			end_date: 245.days.from_now.to_date,
			require_presential_meetings: false,
			manager: manager)
developer = Developer.create!(email: 'user@developer.com', password:'123456')

Profile.create!(full_name: 'John Travolta', social_name: 'john', 
				birth_date: '10/05/1975', education: 'Engenharia social', 
				skills: 'Ruby, Php, C#, Javascript', employment_history: 'Nasa 3 anos', 
				developer: developer )

Developer.create!(email: 'john@developer.com', password:'123456')
