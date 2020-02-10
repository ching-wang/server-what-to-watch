class WishList < ApplicationRecord
  belongs_to :user
  has_many :wish_list_items, dependent: :destroy
  has_many :movies, through: :wish_list_items

  validates :name, {
    presence: true,
    uniqueness: { case_sensitive: false },
  }
end
