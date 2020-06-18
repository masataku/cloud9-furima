class UsersController < ApplicationController
  def index
    
  end  
  
  def show
    @user = User.find(params[:id])
  end  
  
  def new
    @user = User.new
  end  
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render "new"
    end  
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :text, :password, :image)
  end  
end  
