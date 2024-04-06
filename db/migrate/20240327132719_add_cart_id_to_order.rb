# frozen_string_literal: true

class AddCartIdToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :cart_id, :bigint, default: 0, null: false
  end
end
