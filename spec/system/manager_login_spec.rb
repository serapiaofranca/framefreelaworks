require 'rails_helper'

context 'visitor login as manager' do
    it 'successfully' do
        Manager.create!(email: 'teste@manager.com', password: '123456')

        visit root_path
        click_on 'Entrar como Gestor'
        fill_in 'E-mail', with: 'teste@manager.com'
        fill_in 'Senha', with: '123456'
        click_on 'Entrar'

        expect(page).not_to have_link('Entrar como Gestor')
        expect(page).not_to have_link('Entrar como Desenvolvedor')
    end

    it 'error' do
        
        visit root_path
        click_on 'Entrar como Gestor'
        click_on 'Entrar'

        expect(page).to have_content('E-mail ou senha inválida.')
        expect(page).to have_link('Entrar como Gestor')
        expect(page).to have_link('Entrar como Desenvolvedor')
    end
end