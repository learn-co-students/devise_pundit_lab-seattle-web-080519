Rails.application.routes.draw do
  root to: 'visitors#home'
  # root 'notes#index'
  get '/pages/about', to: 'visitors#about'

  get '/goodbye' => 'application#goodbye'
  get '/forbidden' => 'application#forbidden'
  
  devise_for :users
  resources :users, only: [:index, :show]
  resources :notes

  
end
