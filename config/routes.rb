Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get 'articles', to: 'articles#index'
  # get 'articles/new', to: 'articles#new'
  # post 'articles', to: 'articles#create'
  # get 'articles/:id', to: 'articles#show'
  root to: 'pages#home'
  resources :articles
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
