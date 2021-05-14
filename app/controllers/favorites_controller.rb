class FavoritesController < ApplicationController
  def index
    @q = Topic.ransack(params[:q])
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    @favorite = Favorite.new(user_id: current_user.id, topic_id: params[:topic_id])
    if @favorite.save
      redirect_to ("/topics/#{params[:topic_id]}")
    else
      redirect_to favorites_index_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    @favorite.destroy
    redirect_to ("/topics/#{params[:topic_id]}")
  end
  
  private
  def search_params
    params.require(:q).permit(:shop_name_cont)
  end
  
end
