# frozen_string_literal: true

class PromotionsController < ApplicationController
  before_action :find_promotion, :redirect_if_promotion_unusable

  def update
    if @promotion.update(used: true, cart_id: @current_cart.id)
      redirect_to cart_products_path, notice: 'プロモーションコードを適用しました。'
    else
      render 'cart_products/index', status: :unprocessable_entity
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:code)
  end

  def find_promotion
    @promotion ||= Promotion.find_by(code: promotion_params[:code])
  end

  def redirect_if_promotion_unusable
    return unless promotion_unusable?

    message = if @current_cart.promotion
                'プロモーションコードは既に適用されています。'
              else
                'このプロモーションコードは無効です。コードを確認して、もう一度お試しください。'
              end
    redirect_to cart_products_path, notice: message
  end

  def promotion_unusable?
    @current_cart.promotion || @promotion.nil? || @promotion.used
  end
end
