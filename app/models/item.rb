class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, optional: true, class_name: "User"
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :name, :text, :price, :image, :region, :state, :shipping_charge, :shipping_method, :shipping_date, presence: true
  validates :price, numericality: {greater_than: 299, less_than: 10000000, only_integer: true}
  validates :name, length: {maximum: 40}
  validates :text, length: {maximum: 1000}
  
  def create_notification_like(current_user) #いいねをした時のnotification作成
    notification = current_user.active_notifications.new(
      item_id: id, 
      receiver_id: saler_id, 
      action: "like"
      )
    notification.save
  end
  
  def search_commenter_and_create_notification(current_user, comment_id) #コメントをした時のnotification作成
    commenter_ids = Comment.select(:user_id).where(item_id: id).distinct
    commenter_ids.each do |commenter_id|
      if commenter_id['user_id'] != saler_id  
        create_notification_comment(current_user, comment_id, commenter_id['user_id'])
      end
    end 
    create_notification_comment(current_user, comment_id, saler_id)
  end
  
  def create_notification_comment(current_user, comment_id, commenter_id)
    notification = current_user.active_notifications.new(
      item_id: id, 
      receiver_id: commenter_id, 
      comment_id: comment_id, 
      action: "comment"
      )
    notification.save  
  end  
  
end