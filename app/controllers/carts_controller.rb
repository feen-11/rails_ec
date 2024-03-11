class CartsController < ApplicationController
  # カートの作成。なければ作成という書き方にしてsession_idを入れる
  before_action :set_cart
  def index
    # 同じセッションIDを持つcart_productsを取得
    # if CartProduct.find(@cart.id)
    #   @cart_products = CartProduct.find(@cart.id)
    # end
  end

  private

  def set_cart
    @cart = current_cart
  end
end
