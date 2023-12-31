Rails.application.routes.draw do
  root to: "pages#home"
  resources :lists do
    resources :columns, except: [:index, :show] do
      resources :items, except: [:index, :show]
    end
  end
  devise_for :users
  resources :companies
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
