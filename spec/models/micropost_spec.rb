require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:user) {create(:user)}
  before {sign_in(user)}
  let(:micropost) {create(:micropost)}
  
  it "contentが適切であれば投稿できること" do
    expect(micropost).to be_valid
  end

  it "contentが文字数不足では投稿できないこと" do
    micropost.content="blockquote class=#{"a"*83}"
    expect(micropost).to be_invalid
  end

  it "contentが空では投稿できないこと" do
    micropost.content=nil
    expect(micropost).to be_invalid
  end
end
