require 'rails_helper'

RSpec.describe "Relationships", type: :system do

  let(:user) {create(:user)}
  let(:other_user) {create(:user)}
  before {sign_in(user)}
  
  describe "フォロー機能" do
    it "フォロー成功" do
      visit user_path(other_user)

      expect do

      click_on "Follow"

      end.to change(user.following, :count).by(1)

    end

    it "フォロー解除成功" do
      visit user_path(other_user)

      click_on "Follow"

      expect do

      click_on "Unfollow"
  
      end.to change(user.following, :count).by(-1)
    end
  end

end
