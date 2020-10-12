class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :destroy, :logout]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :existence_user, {only: [:show, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:show, :edit, :update, :destroy]}
  before_action :set_user, {only: [:show, :edit, :update, :destroy, :saling_index, :sold_index, :like_index, :buyed_index, :info_index, :user_page
  ]}
  def index
    @users = User.all.order(id: :desc)
    
  end 
  
  
  def show
    @notifications = Notification.all  
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
    
  end
  
  
  def update
    img = user_params[:image]
    
    if @user.update(user_params)
      if !img.nil?
       
        if  @user.image != img.original_filename
          @user.image = img.original_filename
          File.binwrite("public/user_images/#{img.original_filename}", img.read)
        end 
        @user.save
      end
      
      redirect_to request.referrer, notice: "編集しました"
    else
      render 'edit'
    end  
  end  
  
  
  def destroy
    items = @user.saling_items
    @user.destroy 
    items.destroy_all
    redirect_to root_path, notice: "退会しました"
  end
  
  
  def login_form
    @user = User.new
  end 
  
  
  def login
    if @user = User.find_by(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "ログインしました"
    else
      redirect_to users_login_path, notice: "メールアドレスかパスワードが間違っています"
    end  
  end 
  
  
  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました"
  end
  
  
  def user_page
    @items = Item.where(saler_id: @user).order(created_at: :desc)
  end
  
  
  def addressee
    @user = @current_user
  end
  
  
  def password
    @user = @current_user
  end  
  
  
  def identity
    @user = @current_user
  end  
  
  
  # userのitem一覧
  def like_index
    @items = @current_user.like_items.order(created_at: :desc)
  end
  
  def saling_index
    @items = @user.saling_items.order(created_at: :desc)
  end  
  
  def sold_index
    @items = @user.sold_items
  end
  
  def buyed_index
    @items = @user.buyed_items.order(buyed_or_sold_time: :desc)
  end
  
  
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :text, :password, :image, :first_name, :last_name, :first_reading, :last_reading, :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :real_name, :real_reading, :birthday, :real_postal_code, :real_prefecture, :real_municipality, :real_address, :real_building_name)
  end  
  
  def set_user
    @user = User.find(params[:id])
  end 
  
  def forbid_login_user
    if @current_user
      redirect_to users_path, notice: "既にログインしています"
    end  
  end  
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to user_path(@current_user)
    end  
  end
  
  def existence_user
    unless User.find_by_id(params[:id]) 
      redirect_to user_path(@current_user)
    end  
  end
end  
