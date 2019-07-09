class FoodsController < ApplicationController
  before_action :set_food, only: [:show]
    def add_food
        @food = Food.find(params[:id])
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

    private

    def set_food
      @food = Food.find(params[:id])
    end
end
