Rails.application.routes.draw do
  devise_for :users
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

  # Root page #
  root "pages#index"
end
