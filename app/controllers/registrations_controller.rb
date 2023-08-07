class RegistrationsController < ApplicationController
 
  def create
    @user = User.new(user_params)

    if params[:register_button]
      if @user.save
        session[:user_id] = @user.id
        #make it stay in the same page
        redirect_to request.referer, notice: 'Successfully created account'
      else
        render :new
      end
    end
  end

  def user_params
    params.require(:user).permit(:username, :password) # Add any other permitted attributes
  end

end