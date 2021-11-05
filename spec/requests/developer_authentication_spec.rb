require 'rails_helper'

describe 'User Developer authentication' do
  it 'cannot show profile without login' do
    get '/profiles/1'

    expect(response).to redirect_to(new_developer_session_path)
  end

  it 'cannot show profile form unless authenticated' do
    get '/profiles/new'

    expect(response).to redirect_to(new_developer_session_path)
  end
end
