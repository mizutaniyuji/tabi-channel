Rails.application.routes.draw do
  
  # ログインのルーティング
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  # ユーザーのルーティング
  root to: 'users#new'
  get "toppage", to: "users#new"
  resources :users, only: [:show, :edit, :create, :update]
  
  # コミュニティのルーティング
  resources :communities, only: [:index, :create, :new, :show]
  
  # メッセージのルーティング
  resources :communities do
    resources :messages, only: [:create, :destroy]
  end
  
  
end
