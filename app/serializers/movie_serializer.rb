class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :released, :language, :poster
  belongs_to :director
  has_many :actor_movies
  has_many :actors, through: :actor_movies
end
