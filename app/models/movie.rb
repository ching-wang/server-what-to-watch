class Movie < ApplicationRecord
  belongs_to :director
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  has_many :actor_movies
  has_many :actors, through: :actor_movies
end
