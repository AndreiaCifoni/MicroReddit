Rails.application.routes.draw do
  get 'test_abc/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  resources :users

  resources :posts do
    resources :comments
  end

  post '/comments/:id/plus_point', to: 'comment_points#create'
  post '/comments/:id/minus_point', to: 'comment_points#create'
  delete '/comments/:id/point', to: 'comment_points#destroy'

  post '/posts/:id/plus_point', to: 'post_points#create'
  post '/posts/:id/minus_point', to: 'post_points#create'
  delete '/posts/:id/point', to: 'post_points#destroy'

end
