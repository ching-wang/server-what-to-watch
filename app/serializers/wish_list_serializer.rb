class WishListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image
  belongs_to :user
end
