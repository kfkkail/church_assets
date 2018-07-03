# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks do
    member do
      patch 'complete'
    end
  end
  resources :schedules
  resources :articles
  resources :orgs
  resources :users
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               sign_up: 'register',
               edit: 'settings'
             }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'

  get '/home', to: 'application#home', as: 'home'
  get '/about', to: 'application#about', as: 'about'
  get '/contact', to: 'application#contact', as: 'contact'
  get '/unauthorized', to: 'application#unauthorized', as: 'unauthorized'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
