class NotificationsController < ApplicationController
  
  def index
    @notifications = Notification.where(receiver_id: @current_user.id).limit(100)
  end      
  
  
  
  
  # private
  
  # def notification_params
  #   params.require(:notification).permit(:sender_id, :receiver_id, :comment_id, :action, :checked, :item_id)
  # end  
end
