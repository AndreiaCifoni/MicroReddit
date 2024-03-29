class PostsController < ApplicationController

   before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]

  def index #display list
    if params[:sort] == "point"
      @posts = Post.all.sort_by { |post| post.get_upvotes.size - post.get_downvotes.size }.reverse
    elsif params[:sort] == "title"
      @posts = Post.order(:title)
    else 
      @posts = Post.order(created_at: :desc)
    end
    
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
        
    @post_upvote = @post.get_upvotes.size
    @post_downvote = @post.get_downvotes.size
    @post_points = @post_upvote - @post_downvote
    #@comments = Comment.where(post_id: @post.id)
    
    @comments = @post.comments

  
    
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.unvote_by current_user
    else
      @post.upvote_by(current_user)
    end
    redirect_to request.referer 
  end

  def downvote
    @post = Post.find(params[:id])
    if current_user.voted_down_on? @post
      @post.unvote_by current_user
    else
      @post.downvote_by(current_user)
    end
    redirect_to request.referer
  end

  def update #update specific
  end

  def destroy #delete specific
  end

  def post_params
    params.require(:post).permit(:title, :url)
  end

end
