# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :order
  validates :name, :price, :quantity, presence: true
end
