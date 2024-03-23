# frozen_string_literal: true

class CreateCartProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_products do |t|
      t.bigint :cart_id, null: false
      t.bigint :product_id, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
