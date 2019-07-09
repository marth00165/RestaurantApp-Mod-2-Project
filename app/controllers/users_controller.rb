class UsersController < ApplicationController
    before_action :set_user, only: [:show, :destroy, :edit, :update]
    before_action :user_params, only: [:create]
    def index
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
        @foods = Food.all
        @drinks = Drink.all
        @users = User.all
    end
    def new
     @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user)
      end
    end

    def show
     @count = 1
     @orders = @user.orders
     @orders = @orders.select{|order| order.complete}
    end

    def update
      if @user.update(user_params)
        redirect_to @user
      end

    end

    def destroy
      @user.destroy
      redirect_to users_path
    end


    private
    def set_user
     @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:age, :name, :password, :username)
    end
end
