require 'bcrypt'
class User < ActiveRecord::Base
  validates :username, length: { minimum: 2 }
  validates :password, length: { in:6..20 }
  validates :email, presence: true

  has_secure_password
  has_one :grocery
end
