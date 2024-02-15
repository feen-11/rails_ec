class Admin::ProductsController < ApplicationController

  before_action :login_required

  def index
    @products = Product.all.order(:id)

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
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update(product_params)
      # 保存に成功した場合の処理
      redirect_to admin_products_path, notice: "#{@product.name}を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
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

  def login_required
    redirect_to login_path unless current_user
  end

end
