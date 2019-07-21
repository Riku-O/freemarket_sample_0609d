10.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(
        nickname: nickname,
        email: email,
        password: password
  )
end

Item.create!(
      [
        name: 'test1',
        size: '1',
        condition: '悪くない',
        postage_burden: '1',
        shipping_method: 'シロネコ',
        source_area: '北海道',
        shipping_date: '１週間',
        price: 4000,

      ]
)
