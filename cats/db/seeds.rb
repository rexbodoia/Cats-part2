# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1000.times do
  cat = Cat.create(name: Faker::Name.unique.name, color: Faker::Color.color_name, birth_date: Faker::Date.birthday(0,25), sex: ['M','F'].sample, description: Faker::Lorem.paragraph)
end
5000.times do
  CatRentalRequest.create(cat_id: Random.rand(5000), start_date: Faker::Date.between(500.days.ago, Date.today), end_date: Faker::Date.between(250.days.ago, 250.days.from_now), status: ['PENDING', 'APPROVED', 'DENIED'].sample)
end
# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
