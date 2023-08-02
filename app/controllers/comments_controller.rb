class CommentsController < ApplicationController
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

  def update 
  end

  def destroy 
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
