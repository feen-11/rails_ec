# frozen_string_literal: true

class AddDescriptionToProducts < ActiveRecord::Migration[7.0]
  def change
    change_table :products, bulk: true do |t|
      t.text :description
      t.string :code
    end
  end
end
