class User < ApplicationRecord
  has_many :todos

  validates :firstname, presence: true
  validates :firstname, length: { minimum: 2 }
  validates :password, length: { in: 8..20 }
  validates :email, presence: true

  has_secure_password
end
