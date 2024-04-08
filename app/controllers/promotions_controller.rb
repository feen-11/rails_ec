# frozen_string_literal: true

class PromotionsController < ApplicationController
  def update
    check_used_promotion and return if @current_cart.promotion

    promotion = Promotion.find_by(code: promotion_params[:code])
    if promotion.update(used: true, cart_id: @current_cart.id)
      redirect_to cart_products_path, notice: 'プロモーションコードを適用しました。'
    else
      render 'cart_products/index', status: :unprocessable_entity
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:code)
  end

  def check_used_promotion
    if @current_cart.promotion
      redirect_to cart_products_path, notice: 'プロモーションコードは既に適用されています。'
      return true
    end
    false
  end
end
