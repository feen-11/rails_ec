# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :basic_auth
    before_action :load_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = Product.all.order(:id)
    end

    def show
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        # 保存に成功した場合の処理
        redirect_to admin_products_path, notice: '商品を追加しました'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @product.update(product_params)
        # 保存に成功した場合の処理
        redirect_to admin_products_path, notice: "#{@product.name}を更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: "#{@product.name}を削除しました", status: :see_other
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :evaluation, :image, :description)
    end

    def load_product
      @product = Product.find(params[:id])
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end

  end
end
