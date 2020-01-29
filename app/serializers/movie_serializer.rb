class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :director
end
