Rails.application.routes.draw do
  resources :countries
  resources :destinations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'
  get 'about', to: 'pages#about'
  get 'home', to: 'pages#home'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'

  resources :destinations, except: [:update, :edit, :destroy]
end
