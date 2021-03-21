class Micropost < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  default_scope->{order(creates_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true

end
