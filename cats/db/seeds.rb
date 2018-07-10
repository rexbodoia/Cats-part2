# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do
  Cat.create(name: Faker::Name.unique.name, color: Faker::Color.color_name, birth_date: Faker::Date.birthday(0,25), sex: ['M','F'].sample, description: Faker::Lorem.paragraph)
end
