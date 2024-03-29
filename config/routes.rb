# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
  end
  resources :products do
    resources :cart_products, only: :create
  end
  resources :cart_products, only: %i[index update destroy]
end
