require 'rails_helper'

RSpec.describe "Users", type: :system do
  
  let(:user) {create(:user)}
  let(:other_user) {create(:user)}

  describe "User CRUD" do

    describe "ログイン前" do

      describe "ユーザー新規登録" do

        describe "適切な入力" do

          it "新規登録が成功すること" do
            
            visit new_user_path

            fill_in "Name", with: "kanata"

            fill_in "Email", with: "rails@example.com"

            fill_in "Password", with: "password"

            fill_in "Password confirmation", with: "password"

            click_button "Create my account"

            expect(current_path).to eq user_path(1)

            expect(page).to have_content "User was successfully created!" 
          end

        end

        describe "不適切な入力" do
          context "メールアドレス未記入" do

            it "ユーザー登録が失敗すること" do

              visit new_user_path

              fill_in "Name", with: "kanata"

              fill_in "Password", with: "password"

              fill_in "Password confirmation", with: "password"

              click_button "Create my account"

              expect(current_path).to eq users_path
            end

          end

          context "登録済みメールアドレス" do

            it "新規登録が失敗すること" do
              visit new_user_path

              fill_in "Name", with: "kanata"

              fill_in "Email", with: user.email

              fill_in "Password", with: "password"

              fill_in "Password confirmation", with: "password"

              click_button "Create my account"

              expect(current_path).to eq users_path
            end
          end
        end

      end
    end

    describe "ログイン後" do
        before {sign_in(user)}
      describe "ユーザー編集" do

        context "適切な入力" do
          it "編集が成功すること" do
            visit edit_user_path(user)

            fill_in "Name", with: "kanata"

            fill_in "Email", with: "rails@example.com"

            click_button "Save changes"

            expect(current_path).to eq user_path(user)

            expect(page).to have_content "Profile update"
          end
        end

        context "メールアドレス未記入" do
          it "編集が失敗すること" do
            visit edit_user_path(user)

            fill_in "Name", with: "kanata"

            click_button "Save changes"

            expect(current_path).to eq user_path(user)
          end
        end

        context "登録済みメールアドレス" do
          
          it "編集が失敗すること" do
            visit edit_user_path(user)

            fill_in "Name", with: "kanata"

            fill_in "Email", with: other_user.email

            click_button "Save changes"

            expect(current_path).to eq user_path(user)
          end

        end
      end
    end
  end

  describe "twitterログイン" do
    before {OmniAuth.config.mock_auth[:twitter] = nil }
    it "ログイン成功" do
      Rails.application.env_config['omniauth.auth'] = twitter_mock
      visit new_user_path
      click_on "tw_button"
      expect(current_path).to eq user_path(1) 
    end
    it 'ログイン失敗' do
      Rails.application.env_config['omniauth.auth'] = twitter_invalid_mock
      visit new_user_path
      click_on "tw_button"
      expect(current_path).not_to eq user_path(1)
    end
  end
end
