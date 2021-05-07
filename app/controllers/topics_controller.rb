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
  
   def autocomplete_topic_shop_name
    # params[:company]の値でUser.companyを前方一致検索、company列だけ取り出し、nilと空文字を取り除いた配列
    shops = Topic.by_topic_shop_name_like(autocomplete_params[:topic_shop_name]).pluck(:topic_shop_name).reject(&:blank?)
    render json: shops
    # レスポンスの例: ["てすと１会社","てすと２会社","てすと３会社"]
   end

  private
  def topic_params
    params.require(:topic).permit(:image, :description, :shop_id)
  end
  
  def search_params
    params.require(:q).permit(:shop_name_cont)
  end
  
  def autocomplete_params
      params.permit(:topic_shop_name)
  end
  
end
