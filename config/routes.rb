Rails.application.routes.draw do
  get "login" => "user_sessions#new"
  delete "logout" => "user_sessions#destroy"

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider

  resource :profile, only: [:show, :edit, :update, :destroy]

  resources :user_sessions
  resources :users
  root to: "main#index"
  resources :cards, except: [:new]
  resources :reviews, only: [:new, :create]
  resources :registrations, only: [:new, :create]
end
