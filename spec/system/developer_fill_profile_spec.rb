require 'rails_helper'

context 'developer fill profile' do
    it 'using menu' do
        Developer.create!(email: 'teste@developer.com', password: '123456')

        visit root_path
        click_on 'Entrar como Desenvolvedor'
        fill_in 'E-mail', with: 'teste@developer.com'
        fill_in 'Senha', with: '123456'
        click_on 'Entrar'

        expect(page).to have_link('Completar Perfil')
        expect(page).not_to have_link('Entrar como Gestor')
        expect(page).not_to have_link('Entrar como Desenvolvedor')
        expect(page).to have_content('Login efetuado com sucesso')
    end

    it 'access profile form' do
        Developer.create!(email: 'teste@developer.com', password: '123456')

        visit root_path
        click_on 'Entrar como Desenvolvedor'
        fill_in 'E-mail', with: 'teste@developer.com'
        fill_in 'Senha', with: '123456'
        click_on 'Entrar'
        click_on 'Completar Perfil'

        expect(page).not_to have_link('Completar Perfil')
        expect(page).not_to have_link('Entrar como Gestor')
        expect(page).not_to have_link('Entrar como Desenvolvedor')
        expect(page).not_to have_content('Nome completo')
        expect(page).not_to have_content('Nome social')
        expect(page).not_to have_content('Data nascimento:')
        expect(page).not_to have_content('Escolaridade:')
        expect(page).not_to have_content('Conhecimentos técnicos:')
        expect(page).not_to have_content('Experiência Profissional:')
        expect(page).not_to have_content('Imagem de perfil:')
        expect(page).not_to have_link('Enviar')        
    end

end