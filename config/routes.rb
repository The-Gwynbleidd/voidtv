Rails.application.routes.draw do
  get 'pages/index'

  # Root page #
  root "pages#index"
end
