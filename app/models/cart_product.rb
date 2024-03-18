class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :price, :quantity, presence: true, numericality: { only_integer: true }
end
