class TopicsController < ApplicationController
  def index
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: true).order(created_at: :desc)
  end
  
  def search
    @q = Topic.search(search_params)
    @topics = @q.result(distinct: true).order(created_at: :desc)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
    @comment = current_user.comments.new
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end 

  def update
    #binding.pry
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      redirect_to topics_path
    end
  end

  def mypost
    @q = current_user.topics.ransack(params[:q])
    @topics = @q.result(distinct: true).order(created_at: :desc)
  end

  private
  def topic_params
    params.require(:topic).permit(:image1, :image2, :image3, :image4, :description, :shop_id,)
  end
  
  def search_params
    params.require(:q).permit(:shop_name_cont)
  end
  
end
