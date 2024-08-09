Rails.application.routes.draw do
  devise_for :users

  resources :categories do 
    resources :images, only: [:show], path: '' do 
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  resources :images, only: [:new, :create]

  root to: 'application#index'
end
