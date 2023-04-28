# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'people#show'

  resources :people, only: [:show]

  get 'up' => 'rails/health#show'
end
