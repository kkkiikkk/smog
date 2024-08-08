Rails.application.routes.draw do
  devise_for :users

  # authenticated :users do
  #   resources :images
  # end

  # get '/images', to: 'images#index'
  # get '/images/:id', to: 'images#show'
  # authenticated :users do
  resources :images do
    resources :comments, only: [:create, :index]
  end

  # end
  root to: 'application#index'
end
