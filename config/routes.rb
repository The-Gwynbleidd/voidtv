Rails.application.routes.draw do

  # Static Pages #
  get 'pages/index'

  # Networks #
  resources :networks, only: [:index, :show]

  # Actors #
  resources :actors, only: [:index, :show]

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

    # Actors #
    resources :actors, only: [:new, :create, :edit, :update, :destroy]
    resources :networks, only: [:new, :create, :edit, :update, :destroy]

  end

  # Root page #
  root "pages#index"
end
