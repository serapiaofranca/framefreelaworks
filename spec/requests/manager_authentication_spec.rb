require 'rails_helper'

describe 'User Manager authentication' do
  it 'cannot create project without login' do
    post '/projects'

    expect(response).to redirect_to(new_manager_session_path)
  end

  it 'cannot open new project form unless authenticated' do    
    get new_project_path

    expect(response).to redirect_to(new_manager_session_path)
  end
end