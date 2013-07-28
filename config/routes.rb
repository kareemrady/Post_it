PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  get '/register', to: 'users#new'
  get 'user_posts', to: 'posts#user_posts'
  get 'user_comments', to: 'comments#user_comments'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :posts, except: [:destroy] do
    member do
      post 'vote'
    end
    resources :comments do
    member do
      post 'vote'
    end
  end
end
	resources :categories
	resources :users, only: [ :create]
end
