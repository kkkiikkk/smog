Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get '/profile', to: 'devise/registrations#edit'
  end

  resources :categories do
    resources :subscriptions, only: %i[create destroy]
    resources :images, only: [:show], path: '' do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  resources :images, only: %i[new create index]

  root to: 'application#index'
end
