class DrinksController < ApplicationController
  before_action :set_drink, only: [:show]
  


  private

  def set_drink
    @drink = Drink.find_by(params[:id])
  end
end
