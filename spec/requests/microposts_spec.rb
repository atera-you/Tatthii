require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  describe "アクセス制御" do
    context "ログインしていないユーザーがアクセスしようとしたとき" do
      it "ログインページに移動すること(new)" do
        get new_micropost_path
        expect(response).to redirect_to login_url
      end

      it "ログインページに移動すること（create）" do
        post microposts_path
        expect(response).to redirect_to login_url
      end

      it "ログインページに移動すること（destroy）" do
        delete micropost_path(1)
        expect(response).to redirect_to login_url
      end

    end
    
    context "別のユーザーがアクセスしようとしたとき" do
      let(:user) { create(:user) }
      let(:other_user) { create(:user) }
      before  do
        other_user.id=1
        user.id=2
        sign_in(user)
      end
      it "初期画面に移動すること(destroy)" do
        delete micropost_path(1)
        expect(response).to redirect_to root_url
      end
    end
  end
end
