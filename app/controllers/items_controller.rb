class ItemsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user_of_item, {only:[:edit, :update, :destroy]}
  
  
  
  def index
    @items = Item.all.order(created_at: :desc)
  end
  
  
  def show
    @item = Item.find(params[:id])
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
    
    if @item.save
      redirect_to item_path(@item), notice: "出品しました"
    else
      render 'new'
    end  
  end
  
  
  def edit
    @item = Item.find(params[:id])
  end  
  
  
  def update
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to "/items/#{@current_user.id}/saler_index", notice: "商品を削除しました"
  end
  
  
  def saler_index
    @items = Item.where(saler_id: params[:id])
  end  
  
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :state, :region, :shipping_date)
  end  
end
