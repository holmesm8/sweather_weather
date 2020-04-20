class User < ApplicationRecord
  validates_uniqueness_of :email, presence: true
  validates_presence_of :password_digest, require: true
  validates_confirmation_of :password
  validates :api_key, uniqueness: true, presence: false

  has_secure_password
  has_secure_token :api_key
end
