class LikesController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    @like = @item.likes.build(user: @current_user)
    @item.create_notification_like(@current_user)
    respond_to do |format|
      if @like.save
        # format.html{redirect_to item_path(@like.item)}
        format.js  
      end  
      
    end  
  end
  
  def destroy
    @item = Item.find(params[:item_id])
    @like = Like.find_by(user: @current_user, item: @item)
    @like.destroy
    @like = Like.new
    
    
    respond_to do |format|
      format.js  
    end
  end
  
end
