class DrinksController < ApplicationController
  before_action :set_drink, only: [:show]
  def add_drink
        @drink = Drink.find(params[:id])
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
        @order.drinks << @drink
        redirect_to @order
    end


  private

  def set_drink
    @drink = Drink.find(params[:id])
  end

end
