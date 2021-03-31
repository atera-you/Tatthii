require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:user) {build(:user)}
  let(:micropost) {build(:micropost)}
  
  it "内容が適切であれば投稿できること" do
    pending "何を入力してもcontentがnilになる。dbを見るとhtml入力に限らず全てのcontentがmicropostテーブルではなくsummernote(gem)で実装したaction_text_rich_textsデーブルのcontentに保存されているため、これが原因だと考えられる"
    expect(micropost).to be_valid
  end

  it "内容が空では投稿できないこと" do
    micropost.content=nil
    expect(micropost).to be_invalid
  end
end
