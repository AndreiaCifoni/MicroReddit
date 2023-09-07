class SessionsController < ApplicationController
  
  def create
    user = User.find_by(username: user_params[:username])

    if user.present? && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      #make it stay in the same page

      redirect_to request.referer, notice: 'Logged in successfully'
    else
      #make it stay in the same page
      redirect_to request.referer, notice: 'Invalid username or password'
      
    end

  end
  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end

  def user_params
    params.require(:user).permit(:username, :password) # Add any other permitted attributes
  end
end