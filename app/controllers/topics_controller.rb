class TopicsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def index
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
  end
  
  def search
    @q = Topic.search(search_params)
    @topics = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path, success: '投稿しました'
    else
      flash.now[:danger] = "投稿をやり直して下さい"
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
      redirect_to topics_path, success: '投稿を修正しました'
    else
      flash.now[:danger] = "投稿をやり直して下さい"
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
    @topics = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
  end
  
  def ensure_correct_user
    @topic = Topic.find_by(id: params[:id])
    if @topic.user_id != current_user.id
      redirect_to topics_path, danger: '権限がありません'
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image1, :image2, :image3, :image4, :description, :shop_id,)
  end
  
  def search_params
    params.require(:q).permit(:shop_name_cont)
  end
  
end
