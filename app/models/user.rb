class User < ApplicationRecord
  has_secure_password
  has_many :wish_lists, dependent: :destroy
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :email, confirmation: true
end
