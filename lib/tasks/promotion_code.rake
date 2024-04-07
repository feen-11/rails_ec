# frozen_string_literal: true

namespace :promotion_code do
  desc '割引用プロモーションコードを10個生成'
  task generate: :environment do
    10.times do
      code = SecureRandom.alphanumeric(7)
      discount_price = rand(1..10) * 100

      promotion = Promotion.new(code:, discount_price:)
      promotion.save
      puts "Generated promotion code: #{code} with discount price: #{discount_price}"
    end
  end
end
