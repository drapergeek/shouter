Shouter::Application.routes.draw do
  resource :dashboard, only: [:show]
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]
  resources :photo_shouts, only: [:create]
  resources :users, only: [:show] do
    resources :following_relationships, only: [:create]
  end

  root to: "welcome#index"
end
