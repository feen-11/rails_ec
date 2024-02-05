class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # 保存に成功した場合の処理
      redirect_to admin_products_path, notice: '商品を追加しました'
    end
  end

  def edit
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path, notice: "#{product.name}を削除しました", status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :evaluation, :image, :description)
  end

end
