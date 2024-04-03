# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :basic_auth, only: %i[index show]

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      create_order_products(@order)
      OrderMailer.ordered_email(@order).deliver_now
      clear_cart
      redirect_to root_path, notice: '購入が完了しました。メールをご確認ください。'
    else
      render 'cart_products/index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :first_name,
      :last_name,
      :email,
      :postal_code,
      :country,
      :prefecture,
      :address_one,
      :address_two,
      :credit_number,
      :credit_name,
      :credit_cvv,
      :credit_expiration
    )
          .merge(cart_id: params[:cart_id])
  end

  def clear_cart
    reset_session
  end

  def create_order_products(order)
    order.cart.cart_products.each do |cart_product|
      order.order_products.create(
        name: cart_product.product.name,
        price: cart_product.product.price,
        total_price: cart_product.product.price * cart_product.quantity,
        quantity: cart_product.quantity
      )
    end
  end
end
