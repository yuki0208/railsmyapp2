Rails.application.routes.draw do
  resources :users

  match '/signup', to: 'users#new', via: 'get'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/siginin'

  namespace :static_pages, path: nil do
    get :home
    get :help
    get :siginin
  end
  resources :posts do
  	resources :comments, only: [:create, :destroy]
	end

  root 'static_pages#home'

end
