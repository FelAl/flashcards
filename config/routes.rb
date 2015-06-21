Rails.application.routes.draw do

  get "login" => "user_sessions#new", as: :login
  post "logout" => "user_sessions#destroy", as: :logout

  get '/auth/twitter/callback', to: "user_sessions#create"
  resources :user_sessions
  resources :users
  root to: "main#index"
  resources :cards, except: [:new]
  resources :reviews, only: [:new, :create]
end
