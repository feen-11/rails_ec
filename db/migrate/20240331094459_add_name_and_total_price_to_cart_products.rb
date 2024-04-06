# frozen_string_literal: true

class AddNameAndTotalPriceToCartProducts < ActiveRecord::Migration[7.0]
  def change
    change_table :cart_products, bulk: true do |t|
      t.column :name, :string, null: false, default: 'default_name'
      t.column :total_price, :integer, null: false, default: 0
    end
  end
end
