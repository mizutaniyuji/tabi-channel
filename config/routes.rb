Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get "login", to: "sessions#new"
  post "login", to: "sessons#create"
  delete "logout", to: "sessions#destroy"
  
  root to: 'users#new'
  get "toppage", to: "users#new"
  resources :users, only: [:show, :edit, :create, :update]
  
end
