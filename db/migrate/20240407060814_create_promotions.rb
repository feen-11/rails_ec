# frozen_string_literal: true

class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :code, null: false, unique: true, limit: 7
      t.integer :discount_price, null: false
      t.boolean :used, default: false, null: false
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
