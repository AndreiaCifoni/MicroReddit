class PostsController < ApplicationController
  def index #display list
    @posts = Post.all
  end

  def new #return HTML form for creating a new post
  end

  def create #create a new post
  end

  def show #display specific post
    @post = Post.find(params[:id])
    @post_upvote = PostPoint.where(post_id: @post.id, value: true).count
    @post_downvote = PostPoint.where(post_id: @post.id, value: false).count
    @post_points = @post_upvote - @post_downvote
    #@comments = Comment.where(post_id: @post.id)
    @comments = @post.comments
    
  end

  def update #update specific
  end

  def destroy #delete specific
  end


end
