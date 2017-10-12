Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'static_pages#home'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/', to: 'static_pages#home', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'

  resources :posts do
    resources :comments, only: [:create, :destroy]
	end

end
