class WishListItem < ApplicationRecord
  belongs_to :movie
  belongs_to :wish_list
end
