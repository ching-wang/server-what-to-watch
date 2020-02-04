class WishListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image
  belongs_to :user
  has_many :wish_list_items, serializer: WishListItemSerializer
end
