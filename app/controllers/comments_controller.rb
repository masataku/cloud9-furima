class CommentsController < ApplicationController
  before_action :set_item
  def create
    @comment = @item.comments.build(user: @current_user)
    @comment.body = comment_params[:body]
    @like = @item.likes.build(user: @current_user)
    if @comment.save
      @like.save if @like.valid?
      @item.search_commenter_and_create_notification(@current_user, @comment.id)
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
