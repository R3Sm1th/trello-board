Rails.application.routes.draw do
  resources :lists do
    resources :columns, except: [:index, :show] do
      resources :items, except: [:index, :show]
    end
  end
  resources :companies
  devise_for :users
  resources :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
