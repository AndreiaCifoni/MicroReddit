class PostsController < ApplicationController

   before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]

  def index #display list
    @posts = Post.all
  end

  def new #return HTML form for creating a new post
    @post = current_user.posts.build
  end

  def create #create a new post
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def show #display specific post
    @post = Post.find(params[:id])
    @post_upvote = PostPoint.where(post_id: @post.id, value: true).count
    @post_downvote = PostPoint.where(post_id: @post.id, value: false).count
    @post_points = @post_upvote - @post_downvote
    #@comments = Comment.where(post_id: @post.id)
    @comments = @post.comments
    
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by(current_user)
    redirect_to :back
    puts "********I got upvote"
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by(current_user)
    redirect_to :back
    puts "*******I got downvote"
  end

  def update #update specific
  end

  def destroy #delete specific
  end

  def post_params
    params.require(:post).permit(:title, :url)
  end

end
