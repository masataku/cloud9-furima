class NotificationsController < ApplicationController
  def index
    @notifications = Notification.limit(6).order(created_at: :desc)  
  end      
end
