# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  validates :name, :price, :evaluation, :image, :description, presence: true
end
