class Micropost < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  acts_as_taggable
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true,length: { minimum: 600 }
end

