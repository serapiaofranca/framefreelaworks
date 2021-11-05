require 'rails_helper'

context 'visitor login as developer' do
  it 'successfully' do
    Developer.create!(email: 'teste@developer.com', password: '123456')

    visit root_path
    click_on 'Entrar como Desenvolvedor'
    fill_in 'E-mail', with: 'teste@developer.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).not_to have_link('Entrar como Gestor')
    expect(page).not_to have_link('Entrar como Desenvolvedor')
    expect(page).to have_content('Login efetuado com sucesso')
  end

  it 'error' do
    visit root_path
    click_on 'Entrar como Desenvolvedor'
    click_on 'Entrar'

    expect(page).to have_content('E-mail ou senha inválida.')
    expect(page).to have_link('Entrar como Gestor')
    expect(page).to have_link('Entrar como Desenvolvedor')
  end
end
