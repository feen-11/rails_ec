# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# (1..10).each do |i|
#   product = Product.new(
#     name: "商品#{i}",
#     price: 1000,
#     evaluation: 3,
#     description: '新鮮な卵とふんわり焼き上げたトースト。絶妙な組み合わせが楽しめるスクランブルエッグとトーストのハーモニー。朝の活力をお届けします。'
#   )
#   product.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product01.jpg')),
#                        filename: 'product01.jpg')
#   product.save!
# end

product01 = Product.new(
  name: 'スクランブルエッグ&トースト',
  price: 1200,
  evaluation: 3,
  description: '新鮮な卵とふんわり焼き上げたトースト。絶妙な組み合わせが楽しめるスクランブルエッグとトーストのハーモニー。朝の活力をお届けします。'
)
product01.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product01.jpg')),
                       filename: 'product01.jpg')
product01.save!

product02 = Product.new(
  name: 'サンドイッチ',
  price: 1200,
  evaluation: 4,
  description: 'フレッシュな具材と香り高いパンで作る絶品サンドイッチ。食欲をそそる美味しさをお楽しみください。'
)
product02.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product02.jpg')),
                       filename: 'product02.jpg')
product02.save!

product03 = Product.new(
  name: '牛丼',
  price: 700,
  evaluation: 4,
  description: '濃厚な味わいとジューシーな肉が絶妙に調和した至極の牛丼。心も体も満たされる一杯です。'
)
product03.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product03.jpg')),
                       filename: 'product03.jpg')
product03.save!

product04 = Product.new(
  name: 'みそ田楽',
  price: 400,
  evaluation: 5,
  description: '風味豊かな味噌と焼き野菜の相性抜群。みそ田楽は心地よい食感と深い味わいをお届けします。'
)
product04.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product04.jpg')),
                       filename: 'product04.jpg')
product04.save!

product05 = Product.new(
  name: 'パエリヤ',
  price: 2000,
  evaluation: 5,
  description: 'スペインの伝統料理、豊かな旨みと香り高いソフトな食感が特長。一口食べれば、まるで地中海の風景を感じることでしょう。'
)
product05.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product05.jpg')),
                       filename: 'product05.jpg')
product05.save!

product06 = Product.new(
  name: '海鮮丼',
  price: 1500,
  evaluation: 4,
  description: '新鮮な海の幸が豊富に盛り込まれた海鮮丼。海の恵みが詰まった贅沢な一杯をお楽しみください。'
)
product06.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product06.jpg')),
                       filename: 'product06.jpg')
product06.save!

product07 = Product.new(
  name: 'ハンバーグ',
  price: 1300,
  evaluation: 5,
  description: 'ジューシーで肉汁たっぷりのハンバーグ。外はカリッと、中はふんわり。贅沢な味わいが口いっぱいに広がります。'
)
product07.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product07.jpg')),
                       filename: 'product07.jpg')
product07.save!

product08 = Product.new(
  name: 'カレー',
  price: 1000,
  evaluation: 3,
  description: '濃厚で香り高いスパイスが特徴のカレー。一口食べれば、心も体も温まる至福の味わいが広がります。'
)
product08.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product08.jpg')),
                       filename: 'product08.jpg')
product08.save!

product09 = Product.new(
  name: '金目鯛の煮付け',
  price: 1700,
  evaluation: 5,
  description: '金目鯛の上品な旨みと口溶けの良さが特徴の煮付け。丁寧に煮込まれた逸品で、贅沢なひとときをお楽しみください。'
)
product09.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product09.jpg')),
                       filename: 'product09.jpg')
product09.save!

product10 = Product.new(
  name: 'パンケーキ',
  price: 1200,
  evaluation: 3,
  description: 'ふんわり軽やかな生地に、メープルシロップが良く合う絶品パンケーキ。朝食やティータイムに最適な甘美な味わいをお楽しみください。'
)
product10.image.attach(io: File.open(Rails.root.join('app/assets/images/product/product10.jpg')),
                       filename: 'product10.jpg')
product10.save!
