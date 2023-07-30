Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :companies
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists do
    resources :columns, except: [:index, :show] do
      resources :items, except: [:index, :show]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
