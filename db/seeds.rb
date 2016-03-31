# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


25.times do
  user = User.create(user_name:Faker::Internet.user_name, email:Faker::Internet.email)
  rand(0..5).times do
    Link.create(title:Faker::Hipster.sentence(4,false,7), url:'#', user_id:user.id)
  end
end

value = [1,1,-1]
1000.times do
  Vote.create(user_id:rand(1..User.count), link_id:rand(1..Link.count), value:value.sample)
end
