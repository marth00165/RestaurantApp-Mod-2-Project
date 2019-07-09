class OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @foods = @order.foods
        @drinks = @order.drinks
    end
end
