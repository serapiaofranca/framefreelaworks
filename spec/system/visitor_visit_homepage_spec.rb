require 'rails_helper'

describe 'visitor visit home page' do
    it 'successfully' do
        visit root_path

        expect(page).to have_link('Entrar como Gestor')
        expect(page).to have_link('Entrar como Desenvolvedor')
        expect(page).not_to have_content('Email')
        expect(page).not_to have_content('Senha')
    end
end


 
