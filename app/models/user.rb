class User < ApplicationRecord
  has_secure_password
  has_many :wish_lists, dependent: :destroy
  validates :email, confirmation: true

  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_format_of :username, with: /\A[a-zA-Z0-9]+\Z/

  validates :email, {
    presence: true,
    uniqueness: { case_sensitive: false },
    confirmation: true,
  }

  validates :username, {
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { in: 2..23 },
  }

  #   PASSWORD_FORMAT = /\A
  #   (?=.{8,})
  #   (?=.*\d)
  #   (?=.*[a-z])
  #   (?=.*[A-Z])
  #   (?=.*[[:^alnum:]])
  # /x

  validates :password,
    presence: true,
    length: { in: 6..20 },
    # format: { with: PASSWORD_FORMAT },
    confirmation: true,
    on: :create

  validates :password,
    allow_nil: true,
    length: { in: 6..20 },
    # format: { with: PASSWORD_FORMAT },
    confirmation: true,
    on: :update
end
