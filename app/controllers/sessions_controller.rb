
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    #byebug
   if user && user.authenticate(params[:session][:password])

      log_in user
      redirect_to user_path(user)

   else
     byebug
     flash[:danger] = 'Invalid email/password combination'# Create an error message.
     render 'new'
   end
 end

  def destroy
  end
end
