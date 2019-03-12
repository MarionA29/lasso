require 'faker'
User.destroy_all
Asso.destroy_all

20.times do
  User.create!(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Space.agency)
end

10.times do
  Asso.create!(name: Faker::Creature::Cat.name, description: Faker::ChuckNorris.fact, owner_id: rand(User.first.id..User.last.id))
end
