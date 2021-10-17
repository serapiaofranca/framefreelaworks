describe 'User Manager authentication' do
  #TODO tratar exceção
  #it 'cannot show project without login' do
  #  get '/projects/1'
  #
  #  expect(response).to redirect_to(root_path)
  #end

  it 'cannot show profile unless authenticated' do    
    get '/profiles/1'

    expect(response).to redirect_to(new_developer_session_path)
  end
end