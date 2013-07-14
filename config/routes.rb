PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :posts, except: [:destroy] do
  	resources :comments
  end
	resources :categories
	resources :users, only: [ :create]
end
