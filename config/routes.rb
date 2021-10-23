Rails.application.routes.draw do  
  devise_for :developers
  devise_for :managers
  root to: "home#index"

  resources :projects, only: %i[new create show], shalow: true do
    get 'my_projects', on: :collection
    post 'search_projects', on: :collection
    post 'development', on: :member
    post 'production', on: :member  

    resources :proposals, only: %i[new create show destroy], shallow: true do
      post 'accept', on: :member
      post 'reject', on: :member 
      post 'cancel', on: :member 
    end
  end

  resources :profiles, only: %i[new create show]  
end
