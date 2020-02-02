class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avator, :bio, :email
  has_many :wish_lists
end
