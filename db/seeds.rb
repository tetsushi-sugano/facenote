# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do |n|
  name = Faker::LordOfTheRings.character
  email = Faker::Internet.email
  password = Faker::Internet.password
  uid = SecureRandom.uuid
  User.create!(id: n,
               email: email,
               password: password,
               name: name,
               uid: uid
               )
end

n = 1
while n <= 20
  Topic.create(
    title: "あいうえお",
    content: "かきくけこ",
    user_id: n
  )
  n = n + 1
end

3.times do |i|
  topic = Topic.new(content: 'トピック', user_id: i + 1)
  2.times do
    topic.comments.build(content: 'コメント')
  end
  topic.save
end