# frozen_string_literal: true

class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'を0以上の半角数字で入力してください' }
end
