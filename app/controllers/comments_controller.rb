class CommentsController < ApplicationController
  before_action :set_item
  def create
    @comment = @item.comments.build(user: @current_user)
    @comment.body = comment_params[:body]
    if @comment.save
      redirect_to @item, notice: "コメントしました"
    end  
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to @item, notice: "コメントを削除しました"
    end  
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end  
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
