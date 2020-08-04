class TopController < ApplicationController
  def index
    @items = Item.limit(12).order(created_at: :desc)
  end
end
