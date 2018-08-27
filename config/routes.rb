Rails.application.routes.draw do
  root to: 'sessions#index'
  
  get 'signup', to: 'users#new'
  resources :users
end
