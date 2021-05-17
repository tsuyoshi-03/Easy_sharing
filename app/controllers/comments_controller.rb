class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @topic_id = params["topic_id"]
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path) #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :topic_id)
  end
end