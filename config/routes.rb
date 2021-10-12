Rails.application.routes.draw do  
  devise_for :developers
  devise_for :managers
  root to: "home#index"

  resources :projects, only: %i[new create show] do
    get 'my_projects', on: :collection
  end 
end
