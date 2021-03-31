require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user) {create(:user)}
  let(:other_user) {create(:user)}
  let(:relationship) {user.active_relationships.new(followed_id: other_user.id)}

  it "正常にフォローできること" do
    expect(relationship).to be_valid
  end

  it "フォローした側のidが無ければ無効であること" do
    relationship.follower_id=nil
    expect(relationship).to be_invalid
  end

  it "フォローされた側のidが無ければ無効であること" do
    relationship.followed_id=nil
    expect(relationship).to be_invalid
  end
end
