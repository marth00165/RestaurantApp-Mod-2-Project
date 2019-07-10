class OrdersController < ApplicationController
    def show
        if !logged_in?
            redirect_to root_path
        end
        @order = Order.find(params[:id])
        if current_user.orders.include? @order
        @foods = @order.foods
        @drinks = @order.drinks
        else
            redirect_to root_path
        end
    end
    def checkout
        @order = Order.find(params[:id])
        @order.complete = true
        @order.save
        redirect_to user_path(current_user)
    end
end
