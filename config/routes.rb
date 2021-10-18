Rails.application.routes.draw do  
  devise_for :developers
  devise_for :managers
  root to: "home#index"

  resources :projects, only: %i[new create show] do
    get 'my_projects', on: :collection
    get 'search_projects', on: :collection

    resources :proposals, only: %i[new create show], shallow: true do
      post 'accept', on: :member 
    end
  end

  resources :profiles, only: %i[new create show]  
end
