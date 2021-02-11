require 'rails_helper'

RSpec.describe "Comments", type: :system do
  describe "コメント作成機能のテスト" do
    context "作成に成功する時" do
      before do
        @user = FactoryBot.create(:user)
      end  
      it "ログインユーザーであり,出品された商品が存在し,bodyが空ではなく200字以内で入力されている" do
        sign_in(@user)
        create_item
        fill_in "comment_body", with: "コメントです"
        expect{find('input[name="commit"]').click}.to change {Comment.count}.by(1)
        expect(page).to have_content("コメントしました")
        expect(page).to have_content("コメントです")
      end  
    end
    context "作成に失敗する時" do
      it "ログインユーザーであり,出品された商品が存在するが,bodyが空" do
        user = FactoryBot.create(:user)
        sign_in(user)
        create_item
        fill_in "comment_body", with: nil
        expect{find('input[name="commit"]').click}.to change {Comment.count}.by(0)
        expect(current_path).to eq "/items/#{Item.first.id}/comments"
      end  
      it "ログインユーザーであり,出品された商品が存在するが,bodyが200字より多い" do
        user = FactoryBot.create(:user)
        sign_in(user)
        create_item
        #201字
        fill_in "comment_body", with: "親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を"
        expect{find('input[name="commit"]').click}.to change {Comment.count}.by(0)
        expect(current_path).to eq "/items/#{Item.first.id}/comments"
      end  
      it "ログインしていないと出品された商品があっても,コメントできない" do
        item = FactoryBot.create(:item)
        visit root_path
        expect(page).to have_content item.name
        find(".item-link").click
        expect(current_path).to eq users_login_path
      end  
    end  
  end  
end
