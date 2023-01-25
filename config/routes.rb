Rails.application.routes.draw do
  root to: 'pages#home'
  resources :articles
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/delete_profile/:id', to: 'users#destroy', as: 'delete_profile'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
end
