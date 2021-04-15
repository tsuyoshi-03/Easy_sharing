class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @topic_id = params["topic_id"]
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :topic_id)
  end
end