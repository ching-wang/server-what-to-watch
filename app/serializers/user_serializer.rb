class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :password
end
