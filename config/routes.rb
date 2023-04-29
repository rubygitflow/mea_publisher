# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  # https://github.com/sidekiq/sidekiq/wiki/Monitoring
  mount Sidekiq::Web => '/sidekiq'

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'people#index'

  resources :people, only: %i[show index]

  get 'up' => 'rails/health#show'
end
