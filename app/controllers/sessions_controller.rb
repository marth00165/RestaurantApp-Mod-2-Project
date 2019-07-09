
class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    #byebug
   if user && user.authenticate(params[:session][:password])

      log_in user
      redirect_to user_path(user)

   else
     
     flash[:danger] = 'Invalid email/password combination'# Create an error message.
     render 'new'
   end
 end

  def destroy
    session.clear
    redirect_to login_path
  end

end
