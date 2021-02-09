require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー作成機能のテスト" do
    before do
      @user = FactoryBot.build(:user)
    end  
    context "作成に成功する時" do
      it "name,email,passwordが空でない,
          emailが一意性がある" do
        expect(@user).to be_valid
      end
    end 
    context "作成に失敗する時" do
      it "nameが空" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nameを入力してください")
      end 
      it "emailが空" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end 
      it "passwordが空" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end 
      it "emailに一意性がない" do
        another_user = FactoryBot.create(:user)
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailはすでに存在します")
      end 
    end  
  end
  describe "ユーザー編集機能のテスト" do
    before do
      @user = FactoryBot.create(:user)
    end  
    context "ユーザー情報の編集に成功する時" do
      it "nameが空ではなくtextは500字以下で入力される" do
        #500字
        @user.text = "親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供"
        expect(@user).to be_valid
      end
      it "textが空でも編集できる" do
        @user.text = nil
        expect(@user).to be_valid
      end  
    end
    context "ユーザー情報の編集に失敗する時" do
      it "nameが空" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nameを入力してください")
      end
      it "textが500字より多く入力される" do
        #501字
        @user.text = "親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Textは500文字以内で入力してください")
      end  
    end  
  end  
end
