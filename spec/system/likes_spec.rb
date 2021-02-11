require 'rails_helper'

RSpec.describe "Likes", type: :system do
  describe "いいね機能のテスト" do
    before do 
      @user = FactoryBot.create(:user)
    end  
    context "作成に成功する時", js:true do
      it "ログインユーザーであり,出品された商品が存在し,Likeに紐づいた一意性のあるUserとItemが存在しない" do
        sign_in(@user)
        create_item
        expect{find(".like-btn").click}.to change {Like.count}.by(1)
        
      end  
    end
    context "作成に失敗する時" do
      
    end  
  end  
end
