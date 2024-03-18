class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :price, :quantity, :product_id, :cart_id, presence: true, numericality: { only_integer: true }
end
