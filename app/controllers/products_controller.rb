# frozen_string_literal: true

class ProductsController < ApplicationController
  # GET /tasks or /tasks.json
  def index
    @products = Product.all
  end
  
end
