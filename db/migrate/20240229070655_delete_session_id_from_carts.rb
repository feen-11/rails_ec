# frozen_string_literal: true

class DeleteSessionIdFromCarts < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :session_id, :session_id, null: false
  end
end
