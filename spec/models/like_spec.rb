require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "いいね作成機能のテスト" do
    before do 
      @like = FactoryBot.build(:like)
    end  
    context "作成に成功する時" do
      it "Likeに紐づいたUserとItemが存在し,
          そのUserとItemの組み合わせは一意性がある" do
        expect(@like).to be_valid
      end  
    end
    context "作成に失敗する時" do
      it "Likeに紐づいたUserがない" do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Userを入力してください")
      end  
      it "Likeに紐づいたItemがない" do
        @like.item = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Itemを入力してください")
      end  
      it "Likeに紐づいたUserとItemの組み合わせが既に存在する" do
        another_like = Like.create(user_id: 1, item_id: 1)
        @like.user_id = 1 
        @like.item_id = 1
        @like.valid?
        expect(@like.errors.full_messages).to include("Itemを入力してください")
      end  
    end  
  end  
end