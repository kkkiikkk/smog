# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories do
    resources :subscriptions, only: %i[create destroy]
    resources :images, only: [:show], path: '' do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
  resources :images, only: %i[new create index]

  devise_for :users,
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations',
                            omniauth_callbacks: 'users/omniauth' }
  devise_scope :user do
    get '/profile', to: 'devise/registrations#edit'
  end
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Resque::Server, at: '/resque'

  root to: 'application#index'
end
