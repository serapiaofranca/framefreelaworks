require 'rails_helper'

describe 'Manager terminate proposals submission' do
  it 'access menu ' do
    julia = Manager.create!(email: 'julia@manager.com', password: '123456')
    library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros',
                                    requirements: 'Ruby, Raisl,Html, CSS, Javascript',
                                    hourly_rate: 100, expiration_date: '10/05/2022',
                                    start_date: '15/05/2022', end_date: '10/07/2022', manager: julia)

    pablo = Developer.create!(email: 'pablo@developer.com', password: '123456')
    Profile.create!(full_name: 'Pablo Estevez', social_name: 'paulo',
                    birth_date: '10/05/1992', education: 'Engenharia de Software',
                    skills: 'Ruby, Php, Javascript, CSS, Html, SqlServer',
                    employment_history: 'Nasa Network, 3 anos', developer: pablo)

    Proposal.create!(motivation: 'Experiência em projetos Rails', hourly_rate: 80,
                     weekly_available_hours: 20, expected_completion: '01/07/2022',
                     developer: pablo, project: library_cloud, status: 10)

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: julia.email
    fill_in 'Senha', with: julia.password
    click_on 'Entrar'
    click_on 'Meus Projetos'
    click_on 'Library cloud'

    expect(page).to have_link 'Encerrar envio de propostas'
    expect(page).to have_content library_cloud.title
    expect(page).to have_content library_cloud.description
    expect(page).to have_content 'Popostas recebidas'
    expect(page).to have_link 'pablo@developer.com'
    expect(page).to have_content 'R$ 80,00'
    expect(page).to have_content '20 horas'
    expect(page).to have_content '01/07/2022'
    expect(page).to have_content 'Status: aprovado'
  end

  it 'successfully ' do
    julia = Manager.create!(email: 'julia@manager.com', password: '123456')
    library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros',
                                    requirements: 'Ruby, Raisl,Html, CSS, Javascript',
                                    hourly_rate: 100, expiration_date: '10/05/2022',
                                    start_date: '15/05/2022', end_date: '10/07/2022', manager: julia)

    pablo = Developer.create!(email: 'pablo@developer.com', password: '123456')
    Profile.create!(full_name: 'Pablo Estevez', social_name: 'paulo',
                    birth_date: '10/05/1992', education: 'Engenharia de Software',
                    skills: 'Ruby, Php, Javascript, CSS, Html, SqlServer',
                    employment_history: 'Nasa Network, 3 anos', developer: pablo)

    Proposal.create!(motivation: 'Experiência em projetos Rails', hourly_rate: 80,
                     weekly_available_hours: 20, expected_completion: '01/07/2022',
                     developer: pablo, project: library_cloud, status: 10)

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: julia.email
    fill_in 'Senha', with: julia.password
    click_on 'Entrar'
    click_on 'Meus Projetos'
    click_on 'Library cloud'
    click_on 'Encerrar envio de propostas'

    expect(page).not_to have_link 'Encerrar envio de propostas'
    expect(page).to have_content 'Envio de Propostas encerrado'
    expect(page).to have_content library_cloud.title
    expect(page).to have_content library_cloud.description
    expect(page).to have_content 'Popostas recebidas'
    expect(page).to have_link 'pablo@developer.com'
    expect(page).to have_content 'R$ 80,00'
    expect(page).to have_content '20 horas'
    expect(page).to have_content '01/07/2022'
    expect(page).to have_content 'Status: aprovado'
  end
end
