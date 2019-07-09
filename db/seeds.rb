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
 [{name:"Green Curry",price:13.95,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/elopc5iejzoyhuxettdt",desc:"Green curry paste with bamboo shoots, bell peppers, basil, eggplant and coconut milk. Sweeter than red curry. Does not come with rice. If you would like rice, it will be side order please. Gluten free."},
  {name:"Red Curry",price:13.95,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/tuhgl25vvgkerwhbilcj",desc:"Red curry with bamboo shoots, bell peppers, basil and coconut milk. Does not come with rice. If you would like rice, it will be side order please. Gluten free."},
  {name:"Pahd Thai",price:12.95,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/mhcqq0obj6hmsqnnzdfp",desc:"Stir fried rice noodles with egg, ground peanuts, fresh bean sprouts, green onions and carrot. Gluten free."},
  {name:"Chicken Noodles",price:12.95,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/skrqbnnln9c94lczkjyo",desc:"Stir fried wide rice noodles with chicken, egg, tomatoes, pineapples and carrots."},
  {name:"Stir Fried Beef Salad",price:13.75,imgurl:"https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/image/recipes/ay/09/beef-salad-ay-1892139-x.jpg?itok=QMx5sYf9",desc:"Stir fried beef with lettuce, onions, cucumbers, tomatoes and lime juice."},
  {name:"Tom Yum Soup",price:11.50,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/uvekllbykdmctwlj5vzp",desc:"Hot and sour soup with mushrooms, lemongrass, lime leaves and chili paste. Gluten free."},
  {name:"Deep Fried Spring Rolls",price:7.95,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/tgoosy4j5mmplkidctxb",desc:"4 pieces. Mixed vegetables wrapped in spring roll wrappers and fried."},
  {name:"Blanket Prawns",price:9.50,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/j6g1xy0yamgd9s4lzhyq",desc:"Prawns with cream cheese wrapped in spring roll wrappers and fried. Served with tangy plum sauce."},
  {name:"Chicken Satay",price:9.75,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/e1qdfnvxkcrfepe9cqct",desc:"4 skewers. Marinated in curry powder and coconut milk. Grilled and served with mild spicy peanut sauce and pickled cucumbers. Gluten free."},
  {name:"Grilled Chicken",price:16.50,imgurl:"https://res.cloudinary.com/grubhub/image/upload/f_auto,fl_lossy,q_100,c_fill,w_376/vdgbtb7abwbmny8sk3qv",desc:"A Thai spin on an Indian favorite. Tender chicken marinated in a sweet and spicy mixture of coconut milk, yellow curry and other flavorful spices and then grilled. Does not come with rice. If you would like rice, it will be side order please. Gluten free."}
]

foods.each do |food|
  Food.create(food)
end


drinks = [
  {name:"Coke",price:1.50,imgurl:"https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSWMLHvz3tfoG32TxdmJ7hWPzWH17F2DOd_Hggk2joIhp8vbn9l5QPE64W0Rv-l7wPesPs6IidsaEmur0ZPGlXBErrsbX4WNw1SpxBCfxRZtBZL-SzHaMkr-g&usqp=CAc",desc:"Can of Coke soda"},
  {name:"Long Island",price:12.00,imgurl:"http://www.thedrinkkings.com/wp-content/uploads/2014/06/Long-Island-Iced-Tea-4-630-630x867.jpg",desc:"Long Island Iced Tea"},
  {name:"Water",price:1.00,imgurl:"http://static1.squarespace.com/static/583ca2f2d482e9bbbef7dad9/58863361d2b857a1707bf488/588677d403596ebc5f1d798b/1534376808162/iStock-5078775151900.jpg?format=1500w",desc:"Quench yo thirst boul"},
  {name:"Daiquiri",price:15.00,imgurl:"https://www.thespruceeats.com/thmb/NlUr5BfsXq9uhuPne_RUJxmird8=/1365x1365/smart/filters:no_upscale()/classic-daiquiri-recipe-759294-13_preview-5b0ecc23ba6177003649f0ce.jpeg",desc:"Cocktail with cranberry juice"},
  {name:"Orange Juice",price:5.00,imgurl:"https://assets.marthastewart.com/styles/wmax-520-highdpi/d20/oj-upgrade-103121806/oj-upgrade-103121806_horiz_0.jpg?itok=FwA6P7iy",desc:"Freshly Squeezed Orange Juice"},
  {name:"Cranberry Juice",price:5.00,imgurl:"https://previews.123rf.com/images/margo555/margo5551207/margo555120700015/14372872-glass-of-cranberry-juice-isolated-on-white.jpg",desc:"Cranberry Juice with Ice"},
  {name:"Ro-Special",price:6.90,imgurl:"https://i.pinimg.com/originals/9b/8c/d3/9b8cd318589a5133df256563dd9b42d8.jpg",desc:"Classic Trash Can with a Rohitwist"},
  {name:"Philip-Drank",price:4.20,imgurl:"https://media.glamour.com/photos/5695977393ef4b09520d4b3f/master/w_1600%2Cc_limit/health-fitness-blogs-vitamin-g-1205-apple-juice_vg.jpg",desc:"Some Apple Juice"},
  {name:"Boba Tea",price:5.00,imgurl:"http://bobachine.com/wp-content/uploads/2017/11/IMG_0102.jpg",desc:"Boba Teas So YUMMY!"},
  {name:"Dank",price:420.00,imgurl:"https://i.ytimg.com/vi/hm27yNEMOf8/maxresdefault.jpg",desc:"DANK ASS DRINK"}
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
