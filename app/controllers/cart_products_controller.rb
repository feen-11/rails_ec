# frozen_string_literal: true

class CartProductsController < ApplicationController
  before_action :set_cart
  before_action :load_cart_product, only: %i[update destroy]

  def index; end

  def create
    product = Product.find(cart_product_create_params[:product_id])
    quantity = (cart_product_create_params[:quantity].presence || 1).to_i
    price = calculate_price(product, quantity)

    existing_cart_product = CartProduct.find_by(cart_id: @cart.id, product_id: cart_product_create_params[:product_id])

    
    if existing_cart_product
      existing_cart_product.quantity += quantity
      existing_cart_product.price = calculate_price(product, existing_cart_product.quantity)
      if existing_cart_product.save
        redirect_to root_path, notice: '数量を更新しました。'
      else
        redirect_to root_path, notice: '数量を更新できませんでした。'
      end
    else
      cart_product = CartProduct.new(cart_id: @cart.id, product_id: cart_product_create_params[:product_id],
                                     quantity:, price:)
      if cart_product.save
        redirect_to root_path, notice: '商品をカートに追加しました。'
      else
        redirect_to root_path, notice: '商品をカートに追加できませんでした。'
      end
    end
  end

  def update
    quantity = cart_product_update_params[:quantity].to_i
    price = calculate_price(@cart_product.product, quantity)
    if quantity < 1
      destroy_cart_product
    else
      @cart_product.update(quantity:, price:)
      redirect_to cart_products_path, notice: '数量を更新しました。'
    end
  end

  def destroy
    destroy_cart_product
  end

  private

  def cart_product_create_params
    params.permit(:product_id, :quantity)
  end

  def cart_product_update_params
    params.permit(:quantity)
  end

  def load_cart_product
    @cart_product = CartProduct.find(params[:id])
  end

  def set_cart
    @cart = current_cart
  end

  def calculate_price(product, quantity)
    product.price * quantity
  end

  def destroy_cart_product
    @cart_product.destroy
    redirect_to cart_products_path, notice: '商品をカートから削除しました。'
  end
end
