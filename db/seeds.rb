# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  (1..10).each do |i|
    product = Product.create!(
      name: "商品#{i}",
      price: 1000.to_i,
      evaluation: 3.to_i
      )
    product.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'product', 'product01.jpg')), filename: 'product01.jpg', content_type: 'image/jpeg')
  end