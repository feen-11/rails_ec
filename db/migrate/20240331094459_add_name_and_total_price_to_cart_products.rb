# frozen_string_literal: true

class AddNameAndTotalPriceToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :name, :string, null: true
    add_column :cart_products, :total_price, :integer, null: true

    change_column_null :cart_products, :name, false
    change_column_null :cart_products, :total_price, false
  end
end
