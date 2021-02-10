require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "ユーザーの新規作成機能" do
    before do
      @user = FactoryBot.build(:user)
    end
    context "新規登録に成功する時" do
      it "登録に必要なユーザーの情報が入力されていれば登録できる" do
        visit root_path
        expect(page).to have_content("いますぐサインアップする")
        find(".signup-btn").click
        expect(current_path).to eq new_user_path
        fill_in "user_real_name", with: @user.name
        fill_in "user_real_reading", with: @user.real_reading
        fill_in "user_birthday", with: @user.birthday
        fill_in "user_name", with: @user.name
        fill_in "user_email", with: @user.email
        fill_in "user_password", with: @user.password
        expect{find('input[name="commit"]').click}.to change {User.count}.by(1)
        expect(current_path).to eq user_path(User.first)
        expect(page).to have_content("登録できました")
      end  
    end  
    context "新規登録に失敗する時" do
      it "登録に必要なユーザーの情報が入力されていなければ登録できない" do
        visit root_path
        expect(page).to have_content("いますぐサインアップする")
        find(".signup-btn").click
        expect(current_path).to eq new_user_path
        fill_in "user_real_name", with: nil
        fill_in "user_real_reading", with: @user.real_reading
        fill_in "user_birthday", with: @user.birthday
        fill_in "user_name", with: @user.name
        fill_in "user_email", with: @user.email
        fill_in "user_password", with: @user.password
        expect{find('input[name="commit"]').click}.to change {User.count}.by(0)
        expect(current_path).to eq "/users"
      end  
    end  
  end 
  describe "ユーザーのログイン機能" do
    before do
      @user = FactoryBot.create(:user)
    end  
    context "ログインに成功する時" do
      it "ログインに必要なユーザーの情報が入力されていればログインできる" do
        sign_in(@user)
      end  
    end  
    context "ログインに失敗する時" do
      it "ログインに必要なユーザーの情報が入力されていなければログインできない" do
        visit root_path
        expect(page).to have_content("ログイン")
        find_link("ログイン", href: users_login_path).click
        expect(current_path).to eq users_login_path
        fill_in "user_email", with: nil
        fill_in "user_password", with: @user.password
        expect{find('input[name="commit"]').click}.to change {User.count}.by(0)
        expect(current_path).to eq users_login_path
        expect(page).to have_content("メールアドレスかパスワードが間違っています")
      end  
    end  
  end  
end
