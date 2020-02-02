require "faker"

user_a = User.create(
  username: "Qing",
  avatar: "https://semantic-ui.com/images/avatar2/large/molly.png",
  bio: "All your dreams can come true and I'll make sure of it.",
  email: "qing@gmail.com",
  password: "qing",
)
user_b = User.create(
  username: "Andy",
  avatar: "https://semantic-ui.com/images/avatar2/large/elyse.png",
  bio: "Sprinkling kindness everywhere I go",
  email: "andy@gmail.com",
  password: "andy",
)
user_c = User.create(
  username: "Sergio",
  avatar: "https://semantic-ui.com/images/avatar2/large/matthew.png",
  bio: "I love my followers more than life itself",
  email: "sergio@gmail.com",
  password: "sergio",
)

genre_a = Genre.create(name: "action")
genre_b = Genre.create(name: "horror")
genre_c = Genre.create(name: "comedy")
genre_d = Genre.create(name: "adventure")
genre_e = Genre.create(name: "crime")

director_a = Director.create(name: "Todd Philips")
director_b = Director.create(name: "J.J.Abrams")
director_c = Director.create(name: "Rian Johnson")

movie_a = Movie.create(
  imdb_id: "tt7286456",
  title: "Joker",
  year: 2019,
  language: "English",
  poster: "https://images-na.ssl-images-amazon.com/images/I/71jKxPAMFbL._SY450_.jpg",
  director_id: director_a.id,
)
movie_b = Movie.create(
  imdb_id: "tt2527338",
  title: "Star Wars: The Rise of Skywalker",
  year: 2019,
  language: "English",
  poster: "https://m.media-amazon.com/images/M/MV5BMDljNTQ5ODItZmQwMy00M2ExLTljOTQtZTVjNGE2NTg0NGIxXkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_.jpg",
  director_id: director_b.id,
)
movie_c = Movie.create(
  imdb_id: "tt2015381",
  title: "Guardians of the Galaxy Vol. 2",
  year: 2019,
  language: "English",
  director_id: director_c.id,
  poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg",
)

actor_a = Actor.create(name: Faker::Name.name)
actor_b = Actor.create(name: Faker::Name.name)
actor_c = Actor.create(name: Faker::Name.name)
actor_e = Actor.create(name: Faker::Name.name)
actor_f = Actor.create(name: Faker::Name.name)

actor_movie_a = ActorMovie.create(actor_id: movie_a, movie_id: actor_a)
actor_movie_b = ActorMovie.create(actor_id: movie_a, movie_id: actor_b)
actor_movie_c = ActorMovie.create(actor_id: movie_b, movie_id: actor_e)
actor_movie_c = ActorMovie.create(actor_id: movie_c, movie_id: actor_f)
actor_movie_c = ActorMovie.create(actor_id: movie_b, movie_id: actor_e)
actor_movie_c = ActorMovie.create(actor_id: movie_b, movie_id: actor_c)

movie_genre_a = MovieGenre.create(movie_id: movie_a.id, genre_id: genre_a.id)
movie_genre_c = MovieGenre.create(movie_id: movie_b.id, genre_id: genre_b.id)
movie_genre_d = MovieGenre.create(movie_id: movie_c.id, genre_id: genre_c.id)

wish_list_a = WishList.create(name: "weekend movie", user_id: user_a.id)
wish_list_b = WishList.create(name: "working day movie", user_id: user_b.id)
wish_list_c = WishList.create(name: "holiday movie", user_id: user_c.id)
wish_list_d = WishList.create(name: "christmas movie", user_id: user_a.id)

wish_list_item_a = WishListItem.create(movie_id: movie_a.id, wish_list_id: wish_list_a.id)
wish_list_item_b = WishListItem.create(movie_id: movie_b.id, wish_list_id: wish_list_b.id)
wish_list_item_c = WishListItem.create(movie_id: movie_c.id, wish_list_id: wish_list_c.id)
wish_list_item_d = WishListItem.create(movie_id: movie_a.id, wish_list_id: wish_list_a.id)
wish_list_item_e = WishListItem.create(movie_id: movie_a.id, wish_list_id: wish_list_a.id)
