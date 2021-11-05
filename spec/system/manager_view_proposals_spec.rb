require 'rails_helper'

describe 'Manager view proposals' do
  it 'should view all proposals from owned project' do
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
                     developer: pablo, project: library_cloud)

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: julia.email
    fill_in 'Senha', with: julia.password
    click_on 'Entrar'
    click_on 'Meus Projetos'
    click_on 'Library cloud'

    expect(page).not_to have_content 'Faça parte desse time de desenvolvedores'
    expect(page).to have_content 'Popostas recebidas'
    expect(page).to have_link 'pablo@developer.com'
    expect(page).to have_content 'R$ 80,00'
    expect(page).to have_content '20 horas'
    expect(page).to have_content '01/07/2022'
    expect(page).to have_content 'Status: pendente'
  end

  it 'should not view proposals another owned project' do
    julia = Manager.create!(email: 'julia@manager.com', password: '123456')
    library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros',
                                    requirements: 'Ruby, Raisl,Html, CSS, Javascript',
                                    hourly_rate: 100, expiration_date: '10/05/2022',
                                    start_date: '15/05/2022', end_date: '10/07/2022', manager: julia)
    vagas = Project.create!(title: 'Estacionamento virtual', description: 'Locação virtual de vagas de estacionamento',
                            requirements: 'Php, Lavavel,Html, CSS, Javascript',
                            hourly_rate: 80, expiration_date: '10/04/2022',
                            start_date: '14/04/2022', end_date: '14/06/2022', manager: julia)

    john = Manager.create!(email: 'john@manager.com', password: '123456')
    ingressos = Project.create!(title: 'Ingressos.com', description: 'Site para venda de entradas de eventos',
                                requirements: 'C#, dotNet ,SqlServer, Html, CSS, Javascript',
                                hourly_rate: 90, expiration_date: '11/01/2022',
                                start_date: '15/01/2022', end_date: '15/04/2022', manager: john)

    pablo = Developer.create!(email: 'pablo@developer.com', password: '123456')
    Profile.create!(full_name: 'Pablo Estevez', social_name: 'paulo',
                    birth_date: '10/05/1992', education: 'Engenharia de Software',
                    skills: 'Ruby, Php, Javascript, CSS, Html, SqlServer',
                    employment_history: 'Nasa Network, 3 anos', developer: pablo)

    stela = Developer.create!(email: 'stela@developer.com', password: '123456')
    Profile.create!(full_name: 'Stela Schneider', social_name: 'stela',
                    birth_date: '20/08/1999', education: 'Ciencia de Dados',
                    skills: 'Python, Php, C#, Java, Javascript, Oracle, Ibm, Apache',
                    employment_history: 'H5 Minning, 5 anos', developer: stela)

    Proposal.create!(motivation: 'Experiência em projetos Rails', hourly_rate: 80,
                     weekly_available_hours: 20, expected_completion: '01/07/2022',
                     developer: pablo, project: library_cloud)

    Proposal.create!(motivation: 'Varios projetos em C#', hourly_rate: 70,
                     weekly_available_hours: 25, expected_completion: '12/04/2022',
                     developer: stela, project: ingressos)

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: julia.email
    fill_in 'Senha', with: julia.password
    click_on 'Entrar'
    click_on 'Meus Projetos'
    click_on 'Library cloud'

    expect(page).not_to have_content 'Faça parte desse time de desenvolvedores'
    expect(page).to have_content 'Popostas recebidas'
    expect(page).to have_link 'pablo@developer.com'
    expect(page).to have_content 'R$ 80,00'
    expect(page).to have_content '20 horas'
    expect(page).to have_content '01/07/2022'
    expect(page).not_to have_link 'stela@developer.com'
  end

  it 'not exists proposals from owned project' do
    julia = Manager.create!(email: 'julia@manager.com', password: '123456')
    library_cloud = Project.create!(title: 'Library cloud', description: 'Locação virtual de livros',
                                    requirements: 'Ruby, Raisl,Html, CSS, Javascript',
                                    hourly_rate: 100, expiration_date: '10/05/2022',
                                    start_date: '15/05/2022', end_date: '10/07/2022', manager: julia)

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: julia.email
    fill_in 'Senha', with: julia.password
    click_on 'Entrar'
    click_on 'Meus Projetos'
    click_on 'Library cloud'

    expect(page).not_to have_content 'Faça parte desse time de desenvolvedores'
    expect(page).to have_content 'Nenhuma proposta recebida'
  end

  it 'accept proposal' do
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
                     developer: pablo, project: library_cloud)

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: julia.email
    fill_in 'Senha', with: julia.password
    click_on 'Entrar'
    click_on 'Meus Projetos'
    click_on 'Library cloud'
    click_on 'Aceitar proposta'

    expect(current_path).to eq project_path(library_cloud)
    expect(page).to have_content 'Popostas recebidas'
    expect(page).to have_link 'pablo@developer.com'
    expect(page).to have_content 'R$ 80,00'
    expect(page).to have_content '20 horas'
    expect(page).to have_content '01/07/2022'
    expect(page).to have_content 'Status: aprovado'
    expect(page).not_to have_link 'Aceitar proposta'
  end

  it 'reject proposal' do
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
                     developer: pablo, project: library_cloud)

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: julia.email
    fill_in 'Senha', with: julia.password
    click_on 'Entrar'
    click_on 'Meus Projetos'
    click_on 'Library cloud'
    fill_in :justification, with: 'Não possui horas disponíveis suficientes'
    click_on 'Recusar proposta'

    expect(current_path).to eq project_path(library_cloud)
    expect(page).to have_content 'Popostas recebidas'
    expect(page).to have_link 'pablo@developer.com'
    expect(page).to have_content 'R$ 80,00'
    expect(page).to have_content '20 horas'
    expect(page).to have_content '01/07/2022'
    expect(page).to have_content 'Status: rejeitado'
    expect(page).to have_content 'Mensagem: Não possui horas disponíveis suficientes'
    expect(page).not_to have_link 'Aceitar proposta'
    expect(page).not_to have_link 'Recusar proposta'
  end

  it 'error reject proposal' do
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
                     developer: pablo, project: library_cloud)

    visit root_path
    click_on 'Entrar como Gestor'
    fill_in 'E-mail', with: julia.email
    fill_in 'Senha', with: julia.password
    click_on 'Entrar'
    click_on 'Meus Projetos'
    click_on 'Library cloud'
    click_on 'Recusar proposta'

    expect(page).to have_content 'Mensagem não pode ficar em branco'
    expect(page).to have_content 'Proposta de: paulo'
    expect(page).to have_content 'R$ 80,00'
    expect(page).to have_content(/20/)
    expect(page).to have_content '01/07/2022'
    expect(page).to have_content 'Status: pendente'
    expect(page).to have_link 'Voltar'
  end
end
