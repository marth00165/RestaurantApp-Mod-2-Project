class OrdersController < ApplicationController
    def show
        if !logged_in?
            redirect_to root_path
        end
        @order = Order.find(params[:id])
        if current_user.orders.include? @order
        @foods = @order.foods
        @drinks = @order.drinks
        @total_price = 0.0
        @foods.each do |food|
            @total_price += food.price
        end
        @drinks.each do |drink|
            @total_price += drink.price
        end
        else
            redirect_to root_path
        end
    end
    def checkout
        @order = Order.find(params[:id])
        if !@order.drinks.all.empty? || !@order.foods.all.empty?
            @order.complete = true
            @order.save
            redirect_to user_path(current_user)
        else
            flash[:error] = "Cannot checkout with an empty cart"
            redirect_to users_path
        end

    end
end
