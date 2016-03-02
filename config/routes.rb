Rails.application.routes.draw do

  # Static Pages #
  get 'pages/index'

  # Networks #
  resources :networks

  # Actors #
  resources :actors

  # Ganres #
  resources :genres

  # Resources #
  resources :tags

  # Countries #
  resources :countries

  # Authentication #
  devise_for :users

  # Admin Control Panel #
  namespace :admin do
    root "application#index"
  end

  # Root page #
  root "pages#index"
end
