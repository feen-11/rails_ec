class AddNameAndTotalPriceToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :name, :string, null: false
    add_column :cart_products, :total_price, :integer, null: false
  end
end
