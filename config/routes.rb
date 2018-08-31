Rails.application.routes.draw do
  root to: 'sessions#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  

  
  resources :users do
    member do
    get :all_skills
    get :yet_skills
    get :set_skill
    
    end
  end
  resources :skills
end
