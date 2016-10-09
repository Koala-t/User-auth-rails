Rails.application.routes.draw do

  # resources :users, only: [:new, :create]

  # resources :sessions, only: [:new, :create, :destroy],
  #           path_names: { new: 'login', create: 'sessions', destroy: 'logout'}

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  root 'home#index'
end
