Shouter::Application.routes.draw do
  resource :dashboard, only: [:show]
  resources :shouts, only: [:show, :create]
  root to: "welcome#index"
end
