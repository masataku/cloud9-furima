require 'rails_helper'

RSpec.describe "Tops", type: :request do
  describe "GET /tops" do
    before do
      @item = FactoryBot.create(:item)
    end  
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストすると新規登録リンクが表示されている" do
      get root_path
      expect(response.body).to include "いますぐサインアップする"
    end  
    it "indexアクションにリクエストするとがログインリンクが表示されている" do
      get root_path
      expect(response.body).to include "ログイン"
    end
    it "indexアクションにリクエストすると出品されている商品が表示されている" do
      get root_path
      expect(response.body).to include @item.name
    end  
  end
end
