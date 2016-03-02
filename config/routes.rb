Rails.application.routes.draw do

  # Static Pages #
  get 'pages/index'

  # Networks #
  resources :networks, only: [:index, :show]

  # Actors #
  resources :actors, only: [:index, :show]

  # Ganres #
  resources :genres, only: [:index, :show]

  # Resources #
  resources :tags, only: [:index, :show]

  # Countries #
  resources :countries, only: [:index, :show]

  # Authentication #
  devise_for :users

  # Admin Control Panel #
  namespace :admin do
    root "application#index"

    resources :actors, only: [:new, :create, :edit, :update, :destroy]
    resources :networks, only: [:new, :create, :edit, :update, :destroy]
    resources :genres, only: [:new, :create, :edit, :update, :destroy]
    resources :tags, only: [:new, :create, :edit, :update, :destroy]
    resources :countries, only: [:new, :create, :edit, :update, :destroy]

  end

  # Root page #
  root "pages#index"
end
