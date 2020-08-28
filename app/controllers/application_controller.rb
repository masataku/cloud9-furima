class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  
  # User
  
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
      redirect_to user_path(@current_user)
    end  
  end
  
  def existence_user
    unless User.find_by_id(params[:id]) 
      redirect_to user_path(@current_user)
    end  
  end
  
  # Item
  
  def ensure_correct_user_of_item
    if Item.exists?(params[:id])
      item = Item.find(params[:id]) 
      if @current_user.id != item.saler_id
        redirect_to user_path(@current_user)
      else
        return
      end
      
    else
      redirect_to user_path(@current_user)
    end  
  end 
  
  def correct_item_buyer
    if Item.exists?(params[:id])
      item = Item.find(params[:id])
      if item.saler == @current_user || item.buyer 
        redirect_to user_path(@current_user)
      else
        return
      end
    else
      redirect_to user_path(@current_user)
    end  
  end
 
end
