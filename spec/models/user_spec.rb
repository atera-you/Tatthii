require 'rails_helper'

RSpec.describe User, type: :model do 

  describe  do
    let(:user){build(:user)}
  
    it "適切な名前、メール、パスワードを入力すれば有効であること" do
      expect(user).to be_valid
    end

    it "名前が存在しなければ無効であること" do
      user.name=nil
      expect(user).to be_invalid
    end

    it "メールが存在しなければ無効であること" do
      user.email=nil
      expect(user).to be_invalid
    end

    it "パスワードが存在しなければ無効であること" do
      user.password=nil
      expect(user).to be_invalid
    end

    it "名前が51文字以上なら無効であること" do
      user.name="a"*51
      expect(user).to be_invalid
    end

    it "名前が50文字以下なら有効であること" do
      user.name="a"*50
      expect(user).to be_valid
    end

  it "メールが256文字以上なら無効であること" do
    user.email="a"*244+"@example.com"
    expect(user).to be_invalid
  end

  it "メールが255文字以下なら有効であること" do
    user.email="a"*243+"@example.cow"
    expect(user).to be_valid
  end

    it "パスワードが5文字以内なら無効であること" do
      user.password="rails"
      expect(user).to be_invalid
    end

    it "メールのフォーマットが不適切なら無効であること" do
      user.email="rails@example,cox"
      expect(user).to be_invalid
    end

    it "重複するメールは無効であること" do
      user.save
      @user2=user.dup
      expect(@user2).to be_invalid
    end

    it "大文字小文字が異なっても重複するメールと見なされること" do
      user.save
      @user2=user.dup
      @user2.email=@user2.email.upcase
      expect(@user2).to be_invalid
    end
  
    it "ダイジェストがnilのユーザーに対してはfalseを返す" do
      expect(user.authenticates?("")).to be_falsy
    end
  end

  describe "フォロー機能" do
    let(:user) {create(:user)}
    let(:other_user) {create(:user)}
    before do
      user.follow(other_user)
    end

    it "フォロー成功" do
      expect(user.following?(other_user)).to be_truthy
    end

    it "フォロー解除成功" do
      user.unfollow(other_user)
      expect(user.following?(other_user)).to be_falsy
    end

  end
end