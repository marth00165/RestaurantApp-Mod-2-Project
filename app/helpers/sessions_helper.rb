module SessionsHelper
  def log_in(user)
   session[:user_id] = user.id
 end

 def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_order
    if logged_in?#checks for user logged in?
      current_user.orders.each do |order|
        if order.complete == false
          @current_order = order #finds current order
        end
      end
      if !@current_order #if there is no current order
        @current_order = Order.create(complete: false) #create an order
        current_user.orders << @current_order
      end
      @current_order #return the current order
    end
  end
end
