# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..10).each do |i|
  product = Product.new(
    name: "商品#{i}",
    price: 1000,
    evaluation: 3,
    description: '新鮮な卵とふんわり焼き上げたトースト。絶妙な組み合わせが楽しめるスクランブルエッグとトーストのハーモニー。朝の活力をお届けします。'
  )
  product.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product01.jpg')),
                       filename: 'product01.jpg')
  product.save!
end
