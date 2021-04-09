require 'rails_helper'

RSpec.describe "Microposts", type: :system do
  let(:user) {create(:user)}
  before {sign_in(user)}

  describe "投稿機能" do
    describe "投稿" do
      describe "適切な投稿" do
        it "投稿が成功すること" do
          visit new_micropost_path

          find('div[contenteditable]').send_keys("#{"a"*200}")
          

          click_button "Share"

          expect(current_path).to eq user_path(user)

          expect(page).to have_content  "Sharing success"
        end
      end

      describe "不適切な投稿" do
        context "contentが文字数不足" do
          it "投稿が失敗すること" do
            visit new_micropost_path

            find('div[contenteditable]').send_keys("#{"a"*100}")

            click_button "Share"

            expect(current_path).to eq microposts_path
          end
        end

        context "contentが空では投稿できないこと" do
          it "投稿が失敗すること" do
            visit new_micropost_path

            find('div[contenteditable]').send_keys()

            click_button "Share"

            expect(current_path).to eq microposts_path
          end
        end
      end
    end
  end
  
  describe "削除" do
    it "投稿数が一つ減ること" do
      visit new_micropost_path

      find('div[contenteditable]').send_keys("#{"a"*600}")
          

      click_button "Share"
      
      click_on "削除"

      page.accept_confirm

      expect(page).to have_content "Sharing cancel"  
    end
  end
end
