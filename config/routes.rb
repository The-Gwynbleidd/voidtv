Rails.application.routes.draw do
  # Static Pages #
  get 'pages/index'

  # Networks #
  resources :networks

  # Actors #
  resources :actors

  # Ganres #
  resources :ganres 

  # Root page #
  root "pages#index"
end
