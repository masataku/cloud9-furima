class TopController < ApplicationController
  def index
    @items = Item.limit(12)
  end
end
