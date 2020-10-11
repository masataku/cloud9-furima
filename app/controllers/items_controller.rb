class ItemsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user_of_item, {only:[:edit, :update, :destroy]}
  before_action :set_item, {only: [:show, :edit, :update, :destroy, :buyed]}
  before_action :correct_item_buyer, {only: [:buyed]}
  
  
  def index
    if @search_items
       @items = @search_items.order(created_at: :desc)
    else   
       @items = Item.all.order(created_at: :desc)
    end
  end
  
  
  def show
    @user = @item.saler
    @items = Item.where(saler_id: @user).order(created_at: :desc).limit(9)
    @like = @current_user.likes.find_or_initialize_by(item: @item)
    @comment = Comment.new
    @comments = @item.comments
  end
  
  
  def new
    @item = Item.new
  end  
  
  
  def create
    @item = Item.new(item_params)
    @item.saler = @current_user
    img = item_params[:image]
    if !img.nil?
      @item.image = img.original_filename
      File.binwrite("public/item_images/#{@item.image}", img.read)
    end  
    @item.which_sold_item = "no"
    if @item.save
      redirect_to item_path(@item), notice: "出品しました"
    else
      render 'new'
    end  
  end
  
  
  def edit

  end  
  
  
  def update
    img = item_params[:image]
    
    if @item.update(item_params)
      if !img.nil?
       
        if @item.image != img.original_filename
           @item.image = img.original_filename
           File.binwrite("public/item_images/#{img.original_filename}", img.read)
        end 
        @item.save
        
      end
      redirect_to item_path(@item), notice: "編集しました"
    else
      render 'edit'
    end  
  end
  
  
  def destroy
    @item.destroy
    redirect_to "/users/#{@current_user.id}/saling_index", notice: "商品を削除しました"
  end
  
  
  def buyed
    @item.buyer = @current_user
    @item.buyed_or_sold_time = DateTime.now
    @item.which_sold_item = "yes"
    @item.save
    redirect_to item_path(@item), notice: "購入しました"
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :state, :region, :shipping_date, :shipping_method, :shipping_charge, :buyed_or_sold_time, :which_sold_item_id)
  end  
  
  
  def set_item
    @item = Item.find(params[:id])
  end  
  
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
