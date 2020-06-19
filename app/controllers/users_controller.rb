class UsersController < ApplicationController
  def index
    @users = User.all
    
  end  
  
  def show
    @user = User.find(params[:id])
  end  
  
  def new
    @user = User.new
  end  
  
  def create
    @user = User.new(user_params)
    @user.point = 10000
    if @user.save
      redirect_to user_path(@user), notice: "登録できました"
    else
      render "new"
    end  
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user), notice: "編集しました"
  end  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "退会しました"
  end
  
  def login_form
    
  end  
  
  def login
    @user = User.find_by(user_params)
    redirect_to user_path(@user), notice: "ログインしました"
  end  
  
  def logout
    redirect_to users_login_path, notice: "ログアウトしました"
  end  
  
  def user_params
    params.require(:user).permit(:name, :email, :text, :password, :image)
  end  
end  
