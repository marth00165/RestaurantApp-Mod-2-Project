class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :add_drink, :remove_drink]
    
  def index

  end
  def add_drink
    if logged_in?
        @cur_user = current_user
        @order = current_order
        @order.drinks << @drink
        redirect_to users_path
    end
  end

  def remove_drink
    if logged_in?
      @cur_user = current_user
      @order = current_order
      @order.drinks.delete(@drink)
      #@order.drinks.delete(@drink)
      redirect_to order_path(@order)
    end
  end


  private

  def set_drink
    @drink = Drink.find(params[:id])
  end

end
