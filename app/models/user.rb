class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name:"Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name:"Relationship",
                                  foreign_key:"followed_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  attr_accessor :remember_token
  #before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 },unless: :uid?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false},
                  unless: :uid?

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },allow_nil: true,unless: :uid?

  def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                  BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
      SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token=User.new_token
    update_attribute(:remember_digest,User.digest(remember_token))
  end

  def authenticates?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest,nil)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
      following.include?(other_user)
  end

  def self.find_or_create_from_auth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create!(
      provider: auth.provider,
      uid:      auth.uid,
      name: auth.info.name,
      image_url: auth.info.image,
      password: 'zzzzzz'
    )
    end
    user
  end

end
