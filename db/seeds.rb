# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Food.destroy_all
Drink.destroy_all
Order.destroy_all
DrinkOrder.destroy_all
FoodOrder.destroy_all
Card.destroy_all

User.create(name: "Rohit Pratti", username: "Marth00165", password: "abc", password_confirmation: "abc", age: 23)
User.create(name: "Philip Sterling", username: "Zanith", password: "abc", password_confirmation: "abc", age: 24)

3.times do
    Card.create(
      card_no: rand(1e15...1e16).to_i.to_s,
      sec_code: rand(100...999).to_i,
      pin: rand(1000...9999).to_i,
      user_id: User.first.id
    )
end

3.times do
    Card.create(
      card_no: rand(1e15...1e16).to_i.to_s,
      sec_code: rand(100...999).to_i,
      pin: rand(1000...9999).to_i,
      user_id: User.last.id
    )
end

10.times do
    Food.create(
      name: Faker::Food.dish,
      price: rand(1..5),
      imgurl: Faker::Food.spice,
      desc: Faker::Food.description
    )
end
10.times do
    Drink.create(
      name: Faker::Beer.name,
      price: rand(1..5),
      imgurl: Faker::Beer.yeast,
      desc: Faker::Food.description
    )
end
8.times do
    Order.create(
      user_id: User.last.id,
      complete: true,
    )
end
8.times do
    Order.create(
      user_id: User.first.id,
      complete: true,
    )
end
30.times do
    Order.all.sample.drinks << Drink.all.sample
end
30.times do
    Order.all.sample.foods << Food.all.sample
end

