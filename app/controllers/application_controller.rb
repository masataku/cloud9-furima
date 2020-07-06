class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_current_user
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end  
  
  def authenticate_user
    if @current_user == nil
      redirect_to users_login_path, notice: "ログインが必要です"
    end  
  end  
  
  def forbid_login_user
    if @current_user
      redirect_to users_path, notice: "既にログインしています"
    end  
  end  
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to users_path, notice: "権限がありません"
    end  
  end
  
  def ensure_correct_user_of_item
    if Item.exists?(params[:id])
      item = Item.find(params[:id]) 
      if @current_user.id != item.saler_id
        redirect_to items_path, notice: "権限がありません"
      else
        return
      end
      
    else
      redirect_to items_path, notice: "権限がありません"
    end  
  end 
  
 
end
