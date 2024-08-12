Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :categories do
    resources :images, only: [:show], path: '' do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  resources :images, only: %i[new create index]

  root to: 'application#index'
end
