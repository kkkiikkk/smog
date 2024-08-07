Rails.application.routes.draw do
  devise_for :users

  authenticated :users do
    resources :images
  end

  get '/images', to: 'images#index'
  get '/images/:id', to: 'images#show'
  root to: 'application#index'
end
