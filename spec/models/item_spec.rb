require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能のテスト" do
    before do
      @item = FactoryBot.build(:item)
      # @user = FactoryBot.create(:user)
      # @item.saler = @user
    end
    context "出品に成功する時" do
      it "name,text,price,image,region,state,shipping_charge,shipping_method,shipping_date.saler_idが空ではない,
          nameは40字以内で入力されている,
          textは1000字以内で入力されている,
          priceは半角数字で300~9999999までで入力されている。" do
        expect(@item).to be_valid
      end      
    end
    context "出品に失敗する時" do
      it "nameが空" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Nameを入力してください")
      end  
      it "nameが40字より多く入力されている" do
        #41字
        @item.name = "親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降"
        @item.valid?
        expect(@item.errors.full_messages).to include("Nameは40文字以内で入力してください")
      end  
      it "textが空" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Textを入力してください")
      end  
      it "textが1000字より多く入力されている" do
        #1001字
        @item.text = "親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしてい"
        @item.valid?
        expect(@item.errors.full_messages).to include("Textは1000文字以内で入力してください")
      end  
      it "priceが空" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceを入力してください")
      end  
       it "priceが3全角数字で入力されるている" do
        @item.price = "１０００"        
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end  
      it "priceが300より小さい数で入力されている" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは299より大きい値にしてください")
      end 
       it "priceが9999999より大きい数で入力されている" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは10000000より小さい値にしてください")
      end  
      it "imageが空" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageを入力してください")
      end 
      it "regionが空" do
        @item.region = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Regionを入力してください")
      end  
      it "stateが空" do
        @item.state = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Stateを入力してください")
      end  
      it "shipping_chargeが空" do
        @item.shipping_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping chargeを入力してください")
      end  
      it "shipping_dateが空" do
        @item.shipping_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping dateを入力してください")
      end  
      it "shipping_methodが空" do
        @item.shipping_method = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping methodを入力してください")
      end  
      it "saler_idが空" do
        @item.saler = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Salerを入力してください")
      end  
    end  
  end
end