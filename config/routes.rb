Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :order_lists
  resources :orders
  resources :fruits
  resources :categories
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  resources :users
  get 'fruits/index', to: 'fruits#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
