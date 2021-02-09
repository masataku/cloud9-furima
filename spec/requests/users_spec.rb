require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #new" do
    it "newアクションにリクエストすると正常にレスポンスが返ってくる" do
      get new_user_path
      expect(response.status).to eq 200
    end
    it "newアクションにリクエストすると「登録する」ボタンがある" do
      get new_user_path
      expect(response.body).to include("登録する")
    end  
  end
  describe "GET #login_form" do
    it "login_formアクションにリクエストすると正常にレスポンスが返ってくる" do
      get users_login_path
      expect(response.status).to eq 200
    end
    it "login_formアクションにリクエストすると「ログインする」ボタンがある" do
      get users_login_path
      expect(response.body).to include("ログイン")
    end  
  end
end
