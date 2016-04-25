require 'faker'

10.times do
  resto = Restaurant.new(
    name: Faker::Company.name,
    description: Faker::Lorem.paragraph,
    rating: rand(6)
  )
  resto.save
end
