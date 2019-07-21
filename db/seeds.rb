require 'faker'

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

Category.create!(
          path: 1,
          item: '技術書'
)

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

10.times do |n|
  image = Faker::Avatar.image
  item_id = t
  ItemImage.create!(
             image: image,
             item_id: item_id
  )
  t += 1
end

10.times do |n|
  phone_number = Faker::PhoneNumber.phone_number
  user_id = t
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
  t += 1
end
