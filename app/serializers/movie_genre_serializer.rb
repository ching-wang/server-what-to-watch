class MovieGenreSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :movie
  belongs_to :genre
end
