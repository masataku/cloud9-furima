class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :destroy, :logout]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :updte, :destroy]}
  
  def index
    @users = User.all.order(id: :desc)
    
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
    img = user_params[:image]
    if !img.nil?
      @user.image = img.original_filename
      
      File.binwrite("public/user_images/#{@user.image}", img.read)
    else
      @user.image = "elephant.jpg"
    end  
    if @user.save
      session[:user_id] = @user.id
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
    img = user_params[:image]
    if !img.nil?
      if  @user.image != img.original_filename
        File.binwrite("public/user_images/#{img.original_filename}", img.read)
      end 
    end
    if @user.update(user_params)
      
      redirect_to user_path(@user), notice: "編集しました"
    else
      render 'edit'
    end  
  end  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "退会しました"
  end
  
  def login_form
    
  end  
  
  def login
    if @user = User.find_by(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "ログインしました"
    else
      render 'login_form'
    end  
  end  
  
  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました"
  end  
  
  def user_params
    params.require(:user).permit(:name, :email, :text, :password, :image)
  end  
end  
