require 'rails_helper'

RSpec.describe "Items", type: :system do
  before do 
    @user = FactoryBot.create(:user)
  end  
  describe "商品出品機能のテスト" do
    context "商品の出品に成功する時" do
      it "ログインしており,出品に必要な商品の情報が入力されて入れば出品できる" do
        sign_in(@user)
        find_link("出品", href: new_item_path).click
        expect(current_path).to eq new_item_path
        attach_file("item_image", "public/item_images/オフホワイト.jpg")
        fill_in "item_name", with: "商品名"
        fill_in "item_text", with: "商品説明"
        select("新品未使用", from: "item_state")
        select("送料込み(出品者負担)", from: "item_shipping_charge")
        select("未定", from: "item_shipping_method")
        select("北海道", from: "item_region")
        select("1~2日で発送", from: "item_shipping_date")
        fill_in "item_price", with: 1000
        expect{find('input[name="commit"]').click}.to change {Item.count}.by(1)
        expect(current_path).to eq item_path(Item.first)
        expect(page).to have_content("出品しました")
      end  
    end
    context "商品の出品に失敗する時" do
      it "ログインしているが,出品に必要な商品の情報が入力されていなければ出品できない" do
        sign_in(@user)
        find_link("出品", href: new_item_path).click
        expect(current_path).to eq new_item_path
        attach_file("item_image", "public/item_images/オフホワイト.jpg")
        fill_in "item_name", with: nil
        fill_in "item_text", with: "商品説明"
        select("新品未使用", from: "item_state")
        select("送料込み(出品者負担)", from: "item_shipping_charge")
        select("未定", from: "item_shipping_method")
        select("北海道", from: "item_region")
        select("1~2日で発送", from: "item_shipping_date")
        fill_in "item_price", with: 1000
        expect{find('input[name="commit"]').click}.to change {Item.count}.by(0)
        expect(current_path).to eq "/items"
      end  
    end  
  end  
end
