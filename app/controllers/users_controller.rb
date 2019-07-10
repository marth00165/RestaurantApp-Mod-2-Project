class UsersController < ApplicationController
    before_action :set_user, only: [:show, :destroy, :edit, :update]
    before_action :user_params, only: [:create]


      # if session.include? :user_id
      #       @cur_user = User.find(session[:user_id])
      #       @order = @cur_user.orders.find do |order|
      #         order.complete == false
      #   end
      #
      #   if !@order
      #       @order = Order.create(complete: false)
      #       if session.include? :user_id
      #       @cur_user.orders << @order
      #       end
      #   end

      def index
        if !logged_in?
          redirect_to login_path
        elsif session.include? :user_id
          @cur_user = User.find(session[:user_id])
          @order = @cur_user.orders.find do |order|
            order.complete == false
          end
        end

          if !@order
            @order = Order.create(complete: false)
          end
            if session.include? :user_id
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
      if logged_in?
        if current_user.id == params[:id].to_i
          @count = 1
          @orders = @user.orders
          @orders = @orders.select{|order| order.complete}
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
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
      params.require(:user).permit(:age, :name, :password, :password_confirmation, :username)
    end


end
