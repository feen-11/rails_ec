# frozen_string_literal: true

class PromotionsController < ApplicationController
  def update
    redirect_if_cart_has_promotion and return if @current_cart.promotion
    redirect_if_promotion_invalid and return

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

  #  現在のカートでプロモーションコードが適用されているかチェック
  def redirect_if_cart_has_promotion
    if @current_cart.promotion
      redirect_to cart_products_path, notice: 'プロモーションコードは既に適用されています。'
    end
  end

  # 有効なプロモーションコードかチェック
  def redirect_if_promotion_invalid
    promotion = Promotion.find_by(code: promotion_params[:code])
    if promotion.nil? || promotion.used
      redirect_to cart_products_path, notice: 'このプロモーションコードは無効です。コードを確認して、もう一度お試しください。'
      return true
    end
    false
  end
end
