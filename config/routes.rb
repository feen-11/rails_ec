# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get 'products/new'
    get 'products/create'
    get 'products/edit'
    get 'products/delete'
    resources :users
  end
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
end
