class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(:id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # clear_cart
      OrderMailer.ordered_email(@order).deliver_now
      redirect_to root_path, notice: '購入が完了しました。メールをご確認ください。'
    else
      render 'cart_products/index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :postal_code, :country, :prefecture, :address_1, :address_2, :credit_number, :credit_name, :credit_cvv, :credit_expiration).merge(cart_id: params[:cart_id])
  end
  
  def clear_cart
    reset_session
  end

  # def send_email
  #   OrderMailer.ordered_email(@order).deliver_now
  # end
end
