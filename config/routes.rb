# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
  end
  resources :products do
    resources :cart_products, only: %i[create destroy update]
  end
  resources :carts, only: %i[index]
end
