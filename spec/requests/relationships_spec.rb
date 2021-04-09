require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  describe "アクセス制御" do

    context "ログインしていないユーザーがアクセスしようとしたとき" do
      it "ログイン画面に移動すること（create）" do
        post relationships_path
        expect(response).to redirect_to login_url
      end

      it "ログイン画面に移動すること（destroy）" do
        delete relationship_path(1)
        expect(response).to redirect_to login_url
      end
    end
  end
end
