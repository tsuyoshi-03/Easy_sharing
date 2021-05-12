class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end  
  
  def new
    @shop = Shop.new
  end  
  
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path#, success: '投稿に成功しました'
    else
      #flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def show
  end
  
  def edit
    @shop = Shop.find(params[:id])
  end
  
  def update
     @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shops_path #success: '投稿に成功しました'
    else
      #flash.now[:danger] = "投稿に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      redirect_to shops_path
    end
  end
  
  def autocomplete_shop_name
    # params[:company]の値でUser.companyを前方一致検索、company列だけ取り出し、nilと空文字を取り除いた配列
    shops = Shop.by_name_like(autocomplete_params[:shop_name]).pluck(:name).reject(&:blank?)
    #shops = ["てすと１会社","てすと２会社","てすと３会社"]
    render json: shops
    # レスポンスの例: ["てすと１会社","てすと２会社","てすと３会社"]
  end
  
  private
  def shop_params
    params.require(:shop).permit(:name, :postal_code, :address)
  end
  
  def autocomplete_params
      params.permit(:shop_name)
  end
  
end
