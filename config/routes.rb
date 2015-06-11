Rails.application.routes.draw do
  root to: "main#index"
  resources :cards, except: [:new]
  resources :reviews, only: [:new, :create]
end
