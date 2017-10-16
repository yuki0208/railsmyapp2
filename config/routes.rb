Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :account_activations, only: [:edit]
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  root 'static_pages#home'
  get '/', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts do
    resources :comments, only: [:create, :destroy]
	end
end
