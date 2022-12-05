Rails.application.routes.draw do
  get 'session/login'
  root 'task#input'
  get 'task/output'
  get 'session/create'
  get 'session/logout'
  post 'session/create'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
