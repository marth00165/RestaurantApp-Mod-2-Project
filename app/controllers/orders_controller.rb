class OrdersController < ApplicationController
    def show
        if !logged_in?
            redirect_to root_path
        end
        @order = Order.find(params[:id])
        if current_user.orders.include? @order
            @foods = @order.foods
            @drinks = @order.drinks
            @total_price = @order.total_price
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

    def cardform
      render :creditcardform
    end
    
    def clear_cart
        @order = Order.find(params[:id])
        while !@order.drinks.all.empty?
            @order.drinks.clear
        end
        while !@order.foods.all.empty?
            @order.foods.clear
        end
        redirect_to order_path(@order)
    end

end
