class WishListItemSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :movie
  belongs_to :wish_list
end
