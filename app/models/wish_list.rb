class WishList < ApplicationRecord
  belongs_to :user
  has_many :wish_list_items
  has_many :movies, through: :wish_list_items
end
