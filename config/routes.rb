Rails.application.routes.draw do
  root to: 'sessions#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'search', to: 'skills#search'
  get 'master', to: 'users#master'

  
  resources :users do
    member do
    get :all_skills
    get :yet_skills
    get :set_skill
    
    end
  end
  resources :skills
  resources :categories
  resources :departments
  resources :haveskills
end
