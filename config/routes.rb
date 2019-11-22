Rails.application.routes.draw do
  devise_for :users
  get "users/:id" => "users#show", as: "user"
  get "pages/about" => "notes#about"
  root "notes#index"
  
end
