Rails.application.routes.draw do

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  root to: 'users#new'
  get "toppage", to: "users#new"
  resources :users, only: [:show, :edit, :create, :update]
  
end
