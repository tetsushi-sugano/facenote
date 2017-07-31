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
User.create(
name: name,
email: email,
password: password,
uid: uid
)
end

3.times do |i|
  topic = Topic.new(title: 'ああああ', content: 'トピック', user_id: i + 1)
  2.times do
    topic.comments.build(content: 'コメント', user_id: i + 1)
  end
  topic.save
end