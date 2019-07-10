class FoodsController < ApplicationController
  before_action :set_food, only: [:show]

    def index

    end
    def add_food
        @food = Food.find(params[:id])
        if logged_in?
            @cur_user = current_user
            @order = current_order
            @order.foods << @food
            redirect_to @order
        end
    end

    def remove_food
      @food = Food.find(params[:id])
      if logged_in?
          @cur_user = current_user
          @order = current_order
          @order.foods.delete(@food)
          redirect_to order_path(@order)
      end
    end

    private

    def set_food
      @food = Food.find(params[:id])
    end
end
