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
  resources :carts do
    resources :orders, only: %i[create show]
  end
  resources :orders, only: %i[index]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
