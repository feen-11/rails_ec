class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.string :prefecture, null: false
      t.string :address_1, null: false
      t.string :address_2, null: false
      t.string :credit_number, null: false
      t.string :credit_name, null: false
      t.string :credit_cvv, null: false
      t.string :credit_expiration, null: false

      t.timestamps
    end
  end
end
