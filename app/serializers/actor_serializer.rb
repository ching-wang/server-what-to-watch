class ActorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :actor_movies
  has_many :movies, through: :actor_movies
end
