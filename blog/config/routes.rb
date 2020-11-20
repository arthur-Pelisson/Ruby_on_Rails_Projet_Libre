Rails.application.routes.draw do
  devise_for :users
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "home/index"
  root "home#index"
  resources :articles
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
end
