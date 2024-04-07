# frozen_string_literal: true

class Promotion < ApplicationRecord
  belongs_to :cart
  validates :code, presence: true, format: { with: /\A[a-zA-Z0-9]{7}\z/ }
  validates :discount_price, presence: true, numericality: { only_integer: true, in: 100..1000 }
end
