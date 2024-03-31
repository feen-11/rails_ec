# frozen_string_literal: true

class CartProductsController < ApplicationController
  before_action :load_cart_product, only: %i[update destroy]

  def index
    @order = Order.new
  end

  def create
    product = Product.find(cart_product_create_params[:product_id])
    quantity = (cart_product_create_params[:quantity].presence || 1).to_i
    cart_product = CartProduct.find_or_initialize_by(cart_id: @current_cart.id, product_id: product.id)
    cart_product.name = product.name
    cart_product.price = product.price
    cart_product.quantity = cart_product.quantity.to_i + quantity
    cart_product.total_price = calculate_price(product, cart_product.quantity)

    save_and_redirect(cart_product, cart_product.new_record? ? '商品をカートに追加しました。' : '数量を更新しました。', root_path)
  end

  def update
    quantity = cart_product_update_params[:quantity].to_i
    if quantity < 1
      destroy_cart_product
    else
      # @cart_product.price = cart_product_update_params[:price]
      @cart_product.quantity = quantity
      @cart_product.total_price = calculate_price(@cart_product, quantity)
      save_and_redirect(@cart_product, '数量を更新しました。', cart_products_path)
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

  def calculate_price(cart_product, quantity)
    cart_product.price * quantity
  end

  def destroy_cart_product
    @cart_product.destroy
    redirect_to cart_products_path, notice: '商品をカートから削除しました。'
  end

  def save_and_redirect(cart_product, notice, redirect_path)
    if cart_product.save
      redirect_to(redirect_path, notice:)
    else
      redirect_to redirect_path, notice: '操作を完了できませんでした。'
    end
  end
end
