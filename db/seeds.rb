# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)





25.times do
  User.create(user_name:Faker::Internet.user_name, email:Faker::Internet.email)
end
value = [1,1,1,-1]

2.times do
  name = Faker::Superhero.name
  name = name.downcase.gsub!(/\W+/,"")
  board = Board.create(name:name)
  16.times do
    link = Link.create(title:Faker::Hipster.sentence(4,false,7), url:'#',
                      user_id:rand(2..User.count), board_id: board.id)
    rand(0..50).times do
      vote = link.votes.build(user_id:rand(2..User.count), value:value.sample)
      vote.save
    end
  end
end

500.times do
  comment = Comment.create(user_id:rand(1..User.count),
                link_id:rand(1..Link.count),
                body:Faker::Hipster.sentence(12,false,15))

  rand(0..50).times do
    vote = comment.votes.build(user_id:rand(2..User.count), value:value.sample)
    vote.save
  end
end
