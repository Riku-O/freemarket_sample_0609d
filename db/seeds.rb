require 'faker'
require 'csv'

11.times do |n|
  nickname = Faker::Ancient.god
  email = Faker::Internet.email
  password = "password"
  User.create!(
        nickname: nickname,
        email: email,
        password: password
  )
end

  lady = Category.create(:name => 'レディース')
    lady_tops = lady.children.create(:name => 'トップス')
    lady_jacket = lady.children.create(:name => 'ジャケット/アウター')
    lady_pants = lady.children.create(:name => 'パンツ')
    lady_skirt = lady.children.create(:name => 'スカート')

  men = Category.create(:name => 'メンズ')
    men_tops = men.children.create(:name => 'トップス')
    men_jacket = men.children.create(:name => 'ジャケット/アウター')
  baby_kid = Category.create(:name => 'ベビー・キッズ')
  living = Category.create(:name => 'インテリア・住まい・小物')
  book_music_game = Category.create(:name => '本・音楽・ゲーム')
  hobby = Category.create(:name => 'おもちゃ・ホビー・グッズ')
  cosmetics = Category.create(:name => 'コスメ・香水・美容')

t = 1
10.times do |n|
  name = Faker::Book.title
  size = t
  source_are = Faker::Address.city
  description = Faker::Quote.famous_last_words
  user_id = t
  t += 1
  Item.create!(
        name: name,
        size: size,
        condition: '悪くない',
        postage_burden: '1',
        shipping_method: 'シロネコ',
        source_area: source_are,
        shipping_date: '１週間',
        price: 4000,
        description: description,
        user_id: user_id,
        category_id: 1,
  )
end

u = 1
10.times do |n|
  image = Faker::Avatar.image
  item_id = u
  ItemImage.create!(
             image: image,
             item_id: item_id
  )
  u += 1
end

v = 1
10.times do |n|
  phone_number = Faker::PhoneNumber.phone_number
  user_id = v
  UserInformation.create!(
                   last_name: 'テック',
                   first_name: '太郎',
                   last_name_kana: 'テック',
                   first_name_kana: 'タロウ',
                   birth_year: 1994,
                   birth_month: 06,
                   birth_date: 27,
                   phone_number: phone_number,
                   user_id: user_id
  )
  v += 1
end
