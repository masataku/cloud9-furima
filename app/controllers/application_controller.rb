class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  before_action :search_items
  
  
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end  
  
  def authenticate_user
    if @current_user == nil
      redirect_to users_login_path, notice: "ログインが必要です"
    end  
  end  
  
  def search_items
    @search = Item.ransack(params[:q])
    @search_items = @search.result
  end  
 
end
