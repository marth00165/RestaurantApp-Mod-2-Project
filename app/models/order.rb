class Order < ApplicationRecord
    has_many :food_orders
    has_many :foods, through: :food_orders
    has_many :drink_orders
    has_many :drinks, through: :drink_orders
    belongs_to :user
    def self.complete_orders #returns all orders that are complete
        @orders = self.all
        @orders = @orders.select{|order| order.complete == true}
    end
    def self.most_ordered_food_amount #returns the most ordered food amount as an integer from all orders
        @orders = self.complete_orders
        @foods = Food.all
        @highest_count =  0
        temp_highest_count = 0
        @foods.each do |food|
            @orders.each do |order|
                if order.foods.include? food
                    arr = order.foods.select{|innerfood| innerfood.name == food.name}
                    temp_highest_count += arr.length
                end
            end
            if temp_highest_count > @highest_count
                @highest_count = temp_highest_count
                temp_highest_count = 0
            else
                temp_highest_count = 0
            end
        end
        @highest_count
    end
    def self.most_ordered_food #returns the most ordered food object
        @orders = self.complete_orders
        @foods = Food.all
        @highest_count =  0
        temp_highest_count = 0
        @foods.each do |food|
            @orders.each do |order|
                if order.foods.include? food
                    arr = order.foods.select{|innerfood| innerfood == food}
                    temp_highest_count += arr.length
                end
            end
            if temp_highest_count > @highest_count
                @highest_count = temp_highest_count
                @food = food
                temp_highest_count = 0
            else
                temp_highest_count = 0
            end
        end
        @food
    end
    def self.most_ordered_drink_amount #returns the most ordered drink amount as an integer from all orders that are complete
        @orders = self.complete_orders
        @drinks = Drink.all
        @highest_count =  0
        temp_highest_count = 0
        @drinks.each do |drink|
            @orders.each do |order|
                if order.drinks.include? drink
                    arr = order.drinks.select{|innerdrink| innerdrink.name == drink.name}
                    temp_highest_count += arr.length
                end
            end
            if temp_highest_count > @highest_count
                @highest_count = temp_highest_count
                temp_highest_count = 0
            else
                temp_highest_count = 0
            end
        end
        @highest_count
    end
    def self.most_ordered_drink #returns the most ordered drink object from complete orders
        @orders = self.complete_orders
        @drinks = Drink.all
        @highest_count =  0
        temp_highest_count = 0
        @drinks.each do |drink|
            @orders.each do |order|
                if order.drinks.include? drink
                    arr = order.drinks.select{|innerdrink| innerdrink == drink}
                    temp_highest_count += arr.length
                end
            end
            if temp_highest_count > @highest_count
                @highest_count = temp_highest_count
                @drink = drink
                temp_highest_count = 0
            else
                temp_highest_count = 0
            end
        end
        @drink
    end
    def total_price #total price of a single order
        @total_price = 0.0
        self.foods.each do |food|
            @total_price += food.price
        end
        self.drinks.each do |drink|
            @total_price += drink.price
        end
        @total_price
    end
    def self.average_meal_price #analytics of average meal cost for all orders.
        @total = 0.0
        @orders = self.complete_orders
        @orders.each do |order|
            @total += order.total_price
        end
        @avg_price = @total / @orders.length
    end
   
end
