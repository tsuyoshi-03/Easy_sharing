class UsersController < ApplicationController
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(10)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #0421追記↑
      redirect_to topics_path
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end  
  
  def edit
    @user = User.find(params[:id])
  end 

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end 
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
end
