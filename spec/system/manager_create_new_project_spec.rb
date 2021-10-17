require 'rails_helper'

context 'Manager create new project' do
    it 'access form create_project' do
        manager = Manager.create!(email: 'teste@manager.com', password: '123456')
            
        visit root_path
        click_on 'Entrar como Gestor'
        fill_in 'E-mail', with: manager.email
        fill_in 'Senha', with: manager.password
        click_on 'Entrar'
        click_on 'Cadastrar Projeto'

        expect(page).to have_content('Novo Projeto')
        expect(page).to have_content('Título do Projeto')
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Tecnologias Requeridas')
        expect(page).to have_content('Remuneração por hora')
        expect(page).to have_content('Validade da Proposta')
        expect(page).to have_content('Requer atuação presencial')
        expect(page).to have_content('Previsão de início')
        expect(page).to have_content('Previsão de entrega')
        expect(page).to have_button('Enviar')
    end

    it 'successfully create' do
        manager = Manager.create!(email: 'teste@manager.com', password: '123456')
            
        visit root_path
        click_on 'Entrar como Gestor'
        fill_in 'E-mail', with: manager.email
        fill_in 'Senha', with: manager.password
        click_on 'Entrar'
        click_on 'Cadastrar Projeto'
        fill_in 'Título do Projeto', with: 'Controle de estacionamento'
        fill_in 'Descrição' , with: 'Controle de vagas de estacionamento do condomínio Comercial Estrela'
        fill_in 'Tecnologias Requeridas', with: 'Ruby, RoR ~>6, Postgres ~> 14, JavaScript, Html, CSS'
        fill_in 'Remuneração por hora', with: 60 
        fill_in 'Validade da Proposta', with: '20/05/2022'             
        fill_in 'Previsão de início', with: '25/05/2022'             
        fill_in 'Previsão de entrega', with: '20/07/2022'             
        click_on 'Enviar'

        expect(page).to have_content('Projeto cadastrado com sucesso')
        expect(page).to have_content('Controle de estacionamento')
        expect(page).to have_content('Controle de vagas de estacionamento do condomínio Comercial Estrela')
        expect(page).to have_content('Ruby, RoR ~>6, Postgres ~> 14, JavaScript, Html, CSS')
        expect(page).to have_content('R$ 60,00')
        expect(page).to have_content('20/05/2022')
        expect(page).to have_content('25/05/2022')
        expect(page).to have_content('20/07/2022')
        expect(page).to have_link('Meus Projetos')
        expect(page).to have_link('Sair')
    end

    it 'error on create project' do
        manager = Manager.create(email: 'teste@manager.com', password: '123456')
            
        visit root_path
        click_on 'Entrar como Gestor'
        fill_in 'E-mail', with: manager.email
        fill_in 'Senha', with: manager.password
        click_on 'Entrar'      
        click_on 'Cadastrar Projeto' 
        click_on 'Enviar'

        expect(page).not_to have_content('Projeto cadastrado com sucesso')
        expect(page).to have_content('Título do Projeto não pode ficar em branco')            
        expect(page).to have_content('Descrição não pode ficar em branco')            
        expect(page).to have_content('Tecnologias Requeridas não pode ficar em branco')            
        expect(page).to have_content('Remuneração por hora não pode ficar em branco')            
        expect(page).to have_content('Validade da Proposta não pode ficar em branco')            
        expect(page).to have_link('Meus Projetos')
        expect(page).to have_link('Sair')            
    end
end