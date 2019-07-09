class OrdersController < ApplicationController
    def show
        if !logged_in?
            redirect_to root_path
        end
        if current_user.orders
        @order = Order.find(params[:id])
        @foods = @order.foods
        @drinks = @order.drinks
    end
end
