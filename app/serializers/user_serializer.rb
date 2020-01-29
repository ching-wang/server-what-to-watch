class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password
  has_many :wish_lists
end
