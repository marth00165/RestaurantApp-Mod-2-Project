class FoodsController < ApplicationController
    def add_food
        @food = Food.find(params[:id])
        session[:user_id] = User.all.first.id
        if session.include? :user_id
            @cur_user = User.find(session[:user_id])
        end
        @order = @cur_user.orders.find do |order| 
            order.complete == false
        end
        if !@order
            @order = Order.new(complete: false)
            @cur_user.orders << @order
        end
        @order.foods << @food
        redirect_to @order
    end
end
