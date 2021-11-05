Manager.create(email: 'julia@manager.com', password: '123456')
Manager.create(email: 'robert@manager.com', password: '123456')
Manager.create(email: 'jose@manager.com', password: '123456')

Developer.create(email: 'john@developer.com', password: '123456')
Profile.create!(full_name: 'John Travos', social_name: 'john',
                birth_date: '11/12/1992', education: 'Engenharia social',
                skills: 'Ruby, Php, C#, Javascript', employment_history: 'Nasah 3 anos',
                developer_id: 1)
Profile.last.avatar.attach(io: File.open(File.join(Rails.root, '/storage/rails.png')), filename: 'rails.png',
                           content_type: 'image/png')

Developer.create(email: 'emily@developer.com', password: '123456')
Profile.create!(full_name: 'Emily Campos', social_name: 'Emily',
                birth_date: '20/07/1995', education: 'Ciência da Comutação',
                skills: 'Ruby, Java, Html, CSS, Javascript', employment_history: 'ImBM 2 anos',
                developer_id: 2)
Profile.last.avatar.attach(io: File.open(File.join(Rails.root, '/storage/rails.png')), filename: 'rails.png',
                           content_type: 'image/png')

Project.create(title: 'Livraria Sao Domingos',
               description: 'Biblioteca virtual para locação de livros usados',
               requirements: 'Ruby Rails Html Css Javascript',
               hourly_rate: 100,
               expiration_date: 10.day.from_now.to_date,
               start_date: 15.day.from_now.to_date,
               end_date: 60.day.from_now.to_date,
               require_presential_meetings: false,
               manager_id: 1)
Project.create(title: 'Estacionamento Sta Emilia',
               description: 'Estacionamento virtual para agendamento de vagas',
               requirements: 'PHP Laravel Html Css Javascript',
               hourly_rate: 90,
               expiration_date: 8.day.from_now.to_date,
               start_date: 13.day.from_now.to_date,
               end_date: 57.day.from_now.to_date,
               require_presential_meetings: false,
               manager_id: 2)
Project.create(title: 'Ticket Virtual',
               description: 'Loja virtual para vendas de ingressos',
               requirements: 'Javascript nodeJS React Html Css',
               hourly_rate: 80,
               expiration_date: 15.day.from_now.to_date,
               start_date: 20.day.from_now.to_date,
               end_date: 80.day.from_now.to_date,
               require_presential_meetings: true,
               manager_id: 3)

Proposal.create(motivation: 'Novos desafios em projetos Rails', hourly_rate: 95,
                weekly_available_hours: 20, expected_completion: 70.day.from_now.to_date,
                developer_id: 1, project_id: 1)

Proposal.create(motivation: 'Experiência em projetos web e banco de dados', hourly_rate: 85,
                weekly_available_hours: 20, expected_completion: 67.day.from_now.to_date,
                developer_id: 2, project_id: 1)

Proposal.create(motivation: 'Novos desafios em projetos Rails', hourly_rate: 95,
                weekly_available_hours: 20, expected_completion: 70.day.from_now.to_date,
                developer_id: 1, project_id: 2)

Proposal.create(motivation: 'Experiência em projetos web e banco de dados', hourly_rate: 85,
                weekly_available_hours: 20, expected_completion: 67.day.from_now.to_date,
                developer_id: 2, project_id: 2)

Proposal.create(motivation: 'Novos desafios em projetos Rails', hourly_rate: 95,
                weekly_available_hours: 20, expected_completion: 70.day.from_now.to_date,
                developer_id: 1, project_id: 3)

Proposal.create(motivation: 'Experiência em projetos web e banco de dados', hourly_rate: 85,
                weekly_available_hours: 20, expected_completion: 67.day.from_now.to_date,
                developer_id: 2, project_id: 3)
