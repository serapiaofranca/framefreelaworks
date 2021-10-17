require 'rails_helper'

describe 'Manager view own projects' do
    it 'using menu' do
        julia = Manager.create!(email: 'julia@manager.com', password: '123456')
    
        visit root_path
        click_on 'Entrar como Gestor'   
        fill_in 'E-mail', with: julia.email 
        fill_in 'Senha', with: julia.password 
        click_on 'Entrar'     
       
        expect(page).to have_link('Meus Projetos', href: my_projects_projects_path)
    end

    it 'not exists project' do
        julia = Manager.create!(email: 'julia@manager.com', password: '123456')
    
        visit root_path
        click_on 'Entrar como Gestor'   
        fill_in 'E-mail', with: julia.email 
        fill_in 'Senha', with: julia.password 
        click_on 'Entrar'
        click_on 'Meus Projetos'     
       
        expect(page).to have_link('Meus Projetos', href: my_projects_projects_path)
        expect(page).to have_content('Nenhum Projeto Cadastrado')
    end

    it 'show projects' do
        julia = Manager.create!(email: 'julia@manager.com', password: '123456')
        Project.create!(title: 'Libray', description: 'Virtual library', 
                    requirements: 'Ruby, Raisl,Html, CSS, Javascript', 
                    hourly_rate: 100, expiration_date: '10/05/2022', 
                    start_date: '15/05/2022',end_date: '10/07/2022',manager: julia)
    
        visit root_path
        click_on 'Entrar como Gestor'   
        fill_in 'E-mail', with: julia.email 
        fill_in 'Senha', with: julia.password 
        click_on 'Entrar'
        click_on 'Meus Projetos'     
       
        expect(page).to have_content('Libray')
        expect(page).to have_content('Virtual library')
        expect(page).to have_content('Ruby, Raisl,Html, CSS, Javascript')
        expect(page).to have_content('R$ 100,00')
    end
end