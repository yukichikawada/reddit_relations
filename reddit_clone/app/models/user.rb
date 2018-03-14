class User < ApplicationRecord
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, :password_digest, :session_token, presence: true
  before_validation :ensure_token

  has_many :subs,
    foreign_key: :moderator,
    class_name: :Sub

  has_many :posts,
    foreign_key: :author,
    class_name: :Post

  attr_reader :password

  def ensure_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user && user.is_password?(password)
      user
    else
      nil
    end
  end
end
