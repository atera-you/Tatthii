class Micropost < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  acts_as_taggable
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  VALID_MP_REGEX = /blockquote class=/
  validates :content, presence: true,length: { minimum: 200 },
                      format: { with: VALID_MP_REGEX }
end

