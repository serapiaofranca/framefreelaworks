require 'rails_helper'

context 'developer fills profile' do
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

    expect(page).not_to have_link('Entrar como Gestor')
    expect(page).not_to have_link('Entrar como Desenvolvedor')
    expect(page).to have_content('Nome completo')
    expect(page).to have_content('Nome social')
    expect(page).to have_content('Data de nascimento')
    expect(page).to have_content('Escolaridade')
    expect(page).to have_content('Conhecimentos técnicos')
    expect(page).to have_content('Experiência Profissional')
    expect(page).to have_content('Imagem de perfil')
    expect(page).to have_button('Enviar')
  end

  it 'successfuly complete' do
    john = Developer.create!(email: 'john@developer.com', password: '123456')

    visit root_path
    click_on 'Entrar como Desenvolvedor'
    fill_in 'E-mail', with: john.email
    fill_in 'Senha', with: john.password
    click_on 'Entrar'
    click_on 'Completar Perfil'
    fill_in 'Nome completo', with: 'Teste developer'
    fill_in 'Nome social', with: 'Developer'
    fill_in 'Data de nascimento', with: '10/05/1980'
    fill_in 'Escolaridade', with: '10/05/1980'
    fill_in 'Conhecimentos técnicos', with: 'Html Css Javascript'
    fill_in 'Experiência Profissional', with: 'menos de 2 anos'
    attach_file 'Image', Rails.root.join('public/images/rails.png')
    click_on 'Enviar'

    expect(page).to have_content('Perfil completado com sucesso')
    expect(page).to have_link('Voltar')
    expect(page).to have_content('Teste developer')
    expect(page).to have_content('Developer')
    expect(page).to have_content('10/05/1980')
    expect(page).to have_content('Html Css Javascript')
    expect(page).to have_content('menos de 2 anos')
  end

  it 'error on save' do
    john = Developer.create!(email: 'john@developer.com', password: '123456')

    visit root_path
    click_on 'Entrar como Desenvolvedor'
    fill_in 'E-mail', with: john.email
    fill_in 'Senha', with: john.password
    click_on 'Entrar'
    click_on 'Completar Perfil'
    click_on 'Enviar'

    expect(page).not_to have_content('Perfil completado com sucesso')
    expect(page).to have_button('Enviar')
    expect(page).to have_link('Sair')
    expect(page).to have_content('Nome completo não pode ficar em branco')
    expect(page).to have_content('Nome social não pode ficar em branco')
    expect(page).to have_content('Data de nascimento não pode ficar em branco')
    expect(page).to have_content('Escolaridade não pode ficar em branco')
    expect(page).to have_content('Conhecimentos técnicos não pode ficar em branco')
    expect(page).to have_content('Experiência Profissional não pode ficar em branco')
  end
end
