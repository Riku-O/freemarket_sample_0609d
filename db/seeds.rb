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

# レディースカテゴリ作成
lady = Category.create(:name => 'レディース')

# メンズカテゴリを作成
men = Category.create(:name => 'メンズ')

# レディースサブカテゴリを作成
lady_tops = lady.children.create(:name => 'トップス')
lady_jacket = lady.children.create(:name => 'ジャケット/アウター')
lady_pants = lady.children.create(:name => 'パンツ')
lady_skirt = lady.children.create(:name => 'スカート')
lady_dress = lady.children.create(:name => 'ワンピース')

# メンズサブカテゴリを作成
men_tops = men.children.create(:name => 'トップス')
men_jacket = men.children.create(:name => 'ジャケット/アウター')
men_pants = men.children.create(:name => 'パンツ')

# レディース最下層カテゴリを作成
lady_tops.children.create([{:name => 'Tシャツ/カットソー(半袖/袖なし)'}, {:name => 'Tシャツ/カットソー(七分/長袖)'}, {:name => 'その他'}])
lady_jacket.children.create([{:name => 'テーラードジャケット'}, {:name => 'ノーカラージャケット'}, {:name => 'その他'}])
lady_pants.children.create([{:name => 'デニム/ジーンズ'}, {:name => 'ショートパンツ'}, {:name => 'その他'}])
lady_skirt.children.create([{:name => 'ミニスカート'}, {:name => 'ひざ丈スカート'}, {:name => 'その他'}])
lady_dress.children.create([{:name => 'ミニワンピース'}, {:name => 'ひざ丈ワンピース'}, {:name => 'その他'}])

# メンズ最下層カテゴリを作成
men_tops.children.create([{:name => 'Tシャツ/カットソー(半袖/袖なし)'}, {:name => 'Tシャツ/カットソー(七分/長袖)'}, {:name => 'その他'}])
men_jacket.children.create([{:name => 'テーラードジャケット'}, {:name => 'ノーカラージャケット'}, {:name => 'その他'}])
men_pants.children.create([{:name => 'デニム/ジーンズ'}, {:name => 'ワークパンツ/カーゴパンツ'}, {:name => 'スラックス'}])

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
        category_id: rand(34)
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
