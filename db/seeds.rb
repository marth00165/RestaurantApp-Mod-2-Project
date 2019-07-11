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

foods =
 [{name:"Green Curry",price:13.95,imgurl:"pictures/1.webp",desc:"Green curry paste with bamboo shoots, bell peppers, basil, eggplant and coconut milk. Sweeter than red curry. Does not come with rice. If you would like rice, it will be side order please. Gluten free."},
  {name:"Red Curry",price:13.95,imgurl:"pictures/2.webp",desc:"Red curry with bamboo shoots, bell peppers, basil and coconut milk. Does not come with rice. If you would like rice, it will be side order please. Gluten free."},
  {name:"Pad Thai",price:12.95,imgurl:"pictures/3.webp",desc:"Stir fried rice noodles with egg, ground peanuts, fresh bean sprouts, green onions and carrot. Gluten free."},
  {name:"Chicken Noodles",price:12.95,imgurl:"pictures/4.webp",desc:"Stir fried wide rice noodles with chicken, egg, tomatoes, pineapples and carrots."},
  {name:"Stir Fried Beef Salad",price:13.75,imgurl:"pictures/6.jpg",desc:"Stir fried beef with lettuce, onions, cucumbers, tomatoes and lime juice."},
  {name:"Tom Yum Soup",price:11.50,imgurl:"pictures/7.webp",desc:"Hot and sour soup with mushrooms, lemongrass, lime leaves and chili paste. Gluten free."},
  {name:"Deep Fried Spring Rolls",price:7.95,imgurl:"pictures/8.webp",desc:"4 pieces. Mixed vegetables wrapped in spring roll wrappers and fried."},
  {name:"Blanket Prawns",price:9.50,imgurl:"pictures/9.0.webp",desc:"Prawns with cream cheese wrapped in spring roll wrappers and fried. Served with tangy plum sauce."},
  {name:"Chicken Satay",price:9.75,imgurl:"pictures/10.webp",desc:"4 skewers. Marinated in curry powder and coconut milk. Grilled and served with mild spicy peanut sauce and pickled cucumbers. Gluten free."},
  {name:"Grilled Chicken",price:16.50,imgurl:"pictures/11.webp",desc:"A Thai spin on an Indian favorite. Tender chicken marinated in a sweet and spicy mixture of coconut milk, yellow curry and other flavorful spices and then grilled. Does not come with rice. If you would like rice, it will be side order please. Gluten free."}
]

foods.each do |food|
  Food.create(food)
end


drinks = [
  {name:"Coke",price:1.50,imgurl:"pictures/drink1.webp",desc:"Can of Coke soda"},
  {name:"Long Island",price:12.00,imgurl:"pictures/drink2.jpg",desc:"Long Island Iced Tea"},
  {name:"Water",price:1.00,imgurl:"pictures/drink3.jpg",desc:"Quench yo thirst boul"},
  {name:"Daiquiri",price:15.00,imgurl:"pictures/drink4.jpeg",desc:"Cocktail with cranberry juice"},
  {name:"Orange Juice",price:5.00,imgurl:"pictures/drink5.jpg",desc:"Freshly Squeezed Orange Juice"},
  {name:"Cranberry Juice",price:5.00,imgurl:"pictures/drink6.jpg",desc:"Cranberry Juice with Ice"},
  {name:"Ro-Special",price:6.90,imgurl:"pictures/drink7.jpg",desc:"Classic Trash Can with a Rohitwist"},
  {name:"Philip-Drank",price:4.20,imgurl:"pictures/drink8.jpg",desc:"Some Apple Juice"},
  {name:"Boba Tea",price:5.00,imgurl:"pictures/drink9.jpg",desc:"Boba Teas So YUMMY!"},
  {name:"Dank",price:420.00,imgurl:"pictures/drink10.jpg",desc:"DANK ASS DRINK"}
]

drinks.each do |drink|
  Drink.create(drink)
end

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
