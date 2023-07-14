class UsersController < ApplicationController
  
  def create 
  end

  def show 
    @user = User.find(params[:id])
  end

  def destroy 
  end

end
