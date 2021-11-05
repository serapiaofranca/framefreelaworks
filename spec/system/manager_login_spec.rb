require 'rails_helper'

context 'visitor login as manager' do
  it 'error ' do
    visit root_path
    click_on 'Entrar como Gestor'
    click_on 'Entrar'

    expect(page).to have_content('E-mail ou senha inválida.')
    expect(page).to have_link('Entrar como Gestor')
    expect(page).to have_link('Entrar como Desenvolvedor')
  end

  it 'successfully logged' do
    Manager.create!(email: 'teste@manager.com', password: '123456')

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: 'teste@manager.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).not_to have_link('Entrar como Gestor')
    expect(page).not_to have_link('Entrar como Desenvolvedor')
    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_link('Meus Projetos')
    expect(page).to have_link('Cadastrar Projeto')
  end
  it 'successfully log out' do
    Manager.create!(email: 'teste@manager.com', password: '123456')

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: 'teste@manager.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'
    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso')
    expect(page).to have_link('Entrar como Gestor')
    expect(page).to have_link('Entrar como Desenvolvedor')
  end
end
