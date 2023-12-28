# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  def resized_image
    if image.attached?
      image.variant(resize: '450x300').processed
    else
      image
    end
  end
end
