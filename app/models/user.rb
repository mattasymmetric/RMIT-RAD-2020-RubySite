class User < ApplicationRecord
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 254, },
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

  validates :phone, presence: true, length: { in: 10..13}, numericality: { only_integer: true }

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true


end
