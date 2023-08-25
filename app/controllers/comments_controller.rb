class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :upvote, :downvote]

   def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render "posts/show"
    end
  end

  def upvote
    @comment = Comment.find(params[:id])
    if current_user.voted_up_on? @comment
      @comment.unvote_by current_user
    else
      @comment.upvote_by(current_user)
    end
    redirect_to request.referer 
  end

  def downvote
    @comment = Comment.find(params[:id])
    if current_user.voted_down_on? @comment
      @comment.unvote_by current_user
    else
      @comment.downvote_by(current_user)
    end
    redirect_to request.referer
  end

  def update 
  end

  def destroy 
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
