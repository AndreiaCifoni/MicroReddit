class UsersController < ApplicationController
  
  def create 
  end

  def show 
    @user = User.find(params[:id])
    @comments = @user.comments
    @posts = @user.posts
  end

  def destroy 
  end

end
