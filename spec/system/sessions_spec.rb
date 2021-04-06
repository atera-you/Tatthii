require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let(:user) {create(:user)}
  describe "ログイン" do

    describe "適切な入力" do

      it "ログインが成功すること" do
        visit login_path

        fill_in "Email" , with: user.email

        fill_in "Password" , with: user.password

        click_button "ログイン"

        expect(current_path).to eq user_path(user)

        expect(page).to have_content "Login completed"
      end
    end

    describe "メールアドレスとパスワードの不一致" do

      it "ログインが失敗すること" do
        visit login_path

        fill_in "Email" , with: user.email

        fill_in "Password" , with: "cryptogram"

        click_button "ログイン"

        expect(current_path).to eq login_path
      end
      
    end
  end

  describe "ログアウト" do
    before {sign_in(user)}
    it "ログアウトできること" do
      delete  logout_path

      expect(current_path).to redirect_to root_path

    end

  end

end
