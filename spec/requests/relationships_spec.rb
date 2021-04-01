require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  describe "アクセス制御" do
    
    context "ログインしているユーザーがアクセスしようとするとき" do
      let(:user) {create(:user)}
      let(:other_user) { create(:user) }
      before do
        other_user.id=1
        user.id=2
        sign_in(user)
        post relationships_path(followed_id:1)
      end

      it "プロフィール画面に移動すること（create）" do
        expect(response).to redirect_to other_user
      end

      it "プロフィール画面に移動すること(destroy)" do
        delete relationship_path(1)
        expect(response).to redirect_to other_user
      end
    end

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
