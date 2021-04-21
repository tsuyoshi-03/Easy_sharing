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
  
  private
  def shop_params
    params.require(:shop).permit(:name, :postal_code, :address)
  end
  
end
