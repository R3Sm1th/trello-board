Rails.application.routes.draw do
  resources :lists
  devise_for :users
  resources :users
  resources :companies
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
