require 'bcrypt'

class User < ApplicationRecord
  validates :username, :email, presence: true

  include BCrypt

  has_secure_password

end
