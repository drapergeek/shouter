Shouter::Application.routes.draw do
  resource :dashboard, only: [:show]
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]
  resources :photo_shouts, only: [:create]
  root to: "welcome#index"
end
