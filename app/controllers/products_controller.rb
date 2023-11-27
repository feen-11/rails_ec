# frozen_string_literal: true

class ProductsController < ApplicationController
  # GET /tasks or /tasks.json
  def index
    @products = Product.all
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:task).permit(:title, :description, :status)
  end
end
