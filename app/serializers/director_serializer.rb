class DirectorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :movies
end
