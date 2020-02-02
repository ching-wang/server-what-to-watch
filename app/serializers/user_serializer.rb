class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :email
  has_many :wish_lists
end
