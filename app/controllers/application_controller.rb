# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_cart

  private

  def current_cart
    @current_cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] ||= @current_cart.id
    @current_cart
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
