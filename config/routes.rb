Rails.application.routes.draw do
  # Static Pages #
  get 'pages/index'

  # Networks #
  resources :networks

  # Root page #
  root "pages#index"
end
