Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  resources :users

  resources :posts do
    resources :comments, only: [:create,:update, :destroy]
  end

  post '/comments/:id/plus_point', to: 'comment_points#create'
  post '/comments/:id/minus_point', to: 'comment_points#create'
  delete '/comments/:id/point', to: 'comment_points#destroy'

  post '/posts/:id/plus_point', to: 'post_points#create'
  post '/posts/:id/minus_point', to: 'post_points#create'
  delete '/posts/:id/point', to: 'post_points#destroy'

  #routes for authentication
  #get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
 

end
