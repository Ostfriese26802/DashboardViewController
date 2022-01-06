Rails.application.routes.draw do
  resources :computers
  get 'computers/url/:id', to: 'computers#url'

  resources :gruppes
  resources :users
  resources :start
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'sessions/gem'
  get 'sessions/install'
  get 'sessions/bcrypt'
  get 'sessions/destroy'

 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'


  root :to => 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
