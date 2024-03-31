class AddNameAndTotalPriceToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :name, :string
    add_column :cart_products, :total_price, :integer
  end
end
