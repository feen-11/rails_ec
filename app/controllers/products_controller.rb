# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:id)
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.where.not(id: @product.id).order(created_at: :desc).limit(4)
    @cart_product_quantity = CartProduct.find_by(cart_id: current_cart.id, product_id: params[:id])&.quantity || 1
  end
end
