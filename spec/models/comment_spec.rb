require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "コメント作成機能のテスト" do
    before do
      @comment = FactoryBot.build(:comment)
    end
    context "作成に成功する時" do
      it "bodyが空ではなく200字以内で入力されている,
          Commentに紐づいたUserとItemが存在する" do
        expect(@comment).to be_valid    
      end      
    end
    context "作成に失敗する時" do
      it "bodyが空" do
        @comment.body = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Bodyを入力してください")
      end  
      it "bodyが200字より多く入力されている" do
        #201字
        @comment.body = "あ親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰"
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Bodyは200文字以内で入力してください")
      end  
      it "Commentに紐づいたUserが存在しない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end  
      it "Commentに紐づいたItemが存在しない" do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Itemを入力してください")
      end  
    end  
  end  
end
