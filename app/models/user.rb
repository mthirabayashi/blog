class User < ApplicationRecord
  validates :username, :password_digest, :session_token, :email, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, :email, uniqueness: true

  attr_reader :password

  has_many :posts,
    class_name: "Post",
    foreign_key: :author_id,
    primary_key: :id

  has_many :follower,
    class_name: "Follow",
    foreign_key: :following_id,
    primary_key: :id
  has_many :followers,
    through: :follower,
    source: :person_following

  has_many :following,
    class_name: "Follow",
    foreign_key: :follower_id,
    primary_key: :id
  has_many :followings,
    through: :following,
    source: :person_getting_followed

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
