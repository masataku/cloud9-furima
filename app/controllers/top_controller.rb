class TopController < ApplicationController
  def index
    @items = Item.limit(16).order(created_at: :desc)
    if @current_user
      @like_items = @current_user.like_items.limit(5).order(created_at: :desc)
    end
  end
end
