Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  resources :users

  resources :posts do
    resources :comments, only: [:create,:update, :destroy]do
      member do
        put :like, to: 'comments#upvote'
        put :dislike, to: 'comments#downvote'
      end
    end
    member do
      put :like, to:'posts#upvote'
      put :dislike, to:'posts#downvote'
    end
  end

  # put '/comments/:id/like', to: 'comments#upvote'
  # put '/comments/:id/dislike', to: 'comments#downvote'
 


  #routes for authentication
  post 'sign_up', to: 'registrations#create'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 

end
