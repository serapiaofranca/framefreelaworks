    # README

* Tasks list ~> trello: https://trello.com/b/8LPCuWZf/framefreelaworks

Things you may want to cover:

* Ruby version: 2.7.2

* Rails 6.1.4

* O.S : 20.04.2-Ubuntu x86_64 GNU/Linux

* Configuration: 'bundle install' in root project

* Database creation / inicialization : 'rails db:migrate' in root project

* How to run the test suite: 'rspec'

* Start app ~> in root_project_folder run `rails s` 
    access to web browser: `http://localhost:3000`

* Deployment instructions : *** future implementation


# How to Use system

# => Inicio como Gestor

.  Ao acessar o endereço 'Home' você terá dois links para entrar.
.  A primeira opção - 'Entrar como Gestor' redireciona para a tela de log_in se já for cadastrado,
     ou poderá usar o link 'sign_up' para se cadastrar.
.  Após realizar o login o usuário terá acesso para 'Cadastrar Projetos', ou, caso já tenha
    projetos cadastrado, terá link para acessá-los 'Meus projetos'


# => Inicio como Desenvolvedor

.  Ao acessar o endereço 'Home' você terá dois links para entrar.
.  A segunda opção, 'Entrar como Desenvolvedor' redireciona para a tela de log_in como Desenvolvedor
    se já for cadastrado, ou poderá usar o link 'sign_up' para se cadastrar.
.  Ao fazer login pela primeira vez, o usuário deve preencher o formulário de perfil no link 
    'Completar Perfil' para ter acesso aos projetos cadastrados por gestores à procura de Freelancer's.
.  Após o perfil ser preenchido, o desenvolvedor terá em sua tela inicial todos os projetos disponíveis
    para receber propostas, clicando no 'título' do projeto ele será redirecionado para a página
    com todas informações do projeto, e também terá acesso na mesma página a um formulário para 
    envio de propostas.

.  Na tela inicial o desenvolvedor também tem uma barra de pesquisar onde poderá filtrar projetos por
    palavras-chave que podem estar no título, descrição ou requerimentos do projeto.

