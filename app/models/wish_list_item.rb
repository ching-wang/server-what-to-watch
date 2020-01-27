class WishListItem < ApplicationRecord
  belongs_to :movie
  belongs_to :wishList
end
