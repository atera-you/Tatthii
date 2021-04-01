require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "アクセス制御" do

    context "ログインしているユーザーがアクセスしようとするとき" do
      let(:user) {create(:user)}

      before do
        user.id=1
        sign_in(user)
      end

      it "正しくアクセスできること（edit）" do
        get edit_user_path(1)
        expect(response.status).to eq(200)
      end

    end

    context "ログインしていないユーザーがアクセスしようとしたとき" do

      it "ログインページに移動すること（edit）" do
        get edit_user_path(1)
        expect(response).to redirect_to login_url
      end

      it "ログインページに移動すること(update)" do
        patch user_path(1)
        expect(response).to redirect_to login_url
      end

      it "ログインページに移動すること(delete)" do
        delete user_path(1)
        expect(response).to redirect_to login_url
      end

      it "ログインページに移動すること(following)" do
        get following_user_path(1)
        expect(response).to redirect_to login_url
      end

    end
  
    context "自分以外のユーザーがアクセスしようとした時" do
    
      let(:user) { create(:user) }
      let(:other_user) { create(:user) }
      before  do
        other_user.id=1
        user.id=2
        sign_in(user)
      end
      it "初期画面に移動すること(edit)" do
        get edit_user_path(1)
        expect(response).to redirect_to root_url
      end

      it "初期画面に移動すること（update）" do
        patch user_path(1)
        expect(response).to redirect_to root_url
      end
    end

  end
end
