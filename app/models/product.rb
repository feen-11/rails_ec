# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  validates :name, :image, :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'を0以上の半角整数で入力してください' }
  validates :evaluation, presence: true, numericality: { only_integer: true, in: 1..5, message: 'を1〜5の半角整数で入力してください' }
end
