class CartProductsController < ApplicationController

  before_action :set_cart

  def create
    product = Product.find(cart_product_params[:product_id])
    quantity = cart_product_params[:quantity].present? ? cart_product_params[:quantity].to_i : 1
    price = product.price * quantity

    existing_cart_product = CartProduct.find_by(cart_id: @cart.id, product_id: cart_product_params[:product_id])

    if existing_cart_product
      existing_cart_product.quantity += quantity
      existing_cart_product.price += price
      if existing_cart_product.save
        redirect_to root_path, notice: 'カート内の商品の数量を更新しました。'
      else
        redirect_to root_path, notice: 'カート内の商品の数量を更新できませんでした。'
      end
    else
      @cart_product = CartProduct.new(cart_id: @cart.id, product_id: cart_product_params[:product_id], quantity: quantity, price: price)
      if @cart_product.save
        redirect_to root_path, notice: '商品をカートに追加しました'
      else
        redirect_to root_path, notice: '商品をカートに追加できませんでした'
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

  def set_cart
    @cart = current_cart
  end

end
