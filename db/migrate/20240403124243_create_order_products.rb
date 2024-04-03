class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.references :order, null: false, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :total_price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
