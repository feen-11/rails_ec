# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_one :order, dependent: :destroy
  has_one :promotion, dependent: :destroy
end
