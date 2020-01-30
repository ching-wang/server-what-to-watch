class UserSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :wish_lists
end
