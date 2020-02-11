require "faker"

user_a = User.create(
  username: "Qing",
  avatar: "https://semantic-ui.com/images/avatar2/large/molly.png",
  bio: "All your dreams can come true and I'll make sure of it.",
  email: "qing@test.com",
  password: "password",
)
user_b = User.create(
  username: "Andy",
  avatar: "https://semantic-ui.com/images/avatar2/large/elyse.png",
  bio: "Sprinkling kindness everywhere I go",
  email: "andy@test.com",
  password: "password",
)
user_c = User.create(
  username: "Sergio",
  avatar: "https://semantic-ui.com/images/avatar2/large/matthew.png",
  bio: "I love my followers more than life itself",
  email: "sergio@test.com",
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
movie_d = Movie.create(
  imdb_id: "tt2452244",
  title: "Isn't It Romantic",
  year: 2019,
  language: "English",
  director_id: director_c.id,
  poster: "https://m.media-amazon.com/images/M/MV5BZGE1NGYxOWItODdmMy00NWNhLTgxZmMtYmVjYmViMGI0NTdmXkEyXkFqcGdeQXVyNzE2MTQyMzM@._V1_SX300.jpg",
)
movie_e = Movie.create(
  imdb_id: "tt1679482",
  title: "Supernatural: The Animation",
  year: 2011,
  language: "Japanese",
  director_id: director_a.id,
  poster: "https://m.media-amazon.com/images/M/MV5BNDljNDlkZjctNDFlZi00ZjNjLTkxNDQtOTI5MzY1MGIzNGQ4XkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_SX300.jpg",
)

movie_f = Movie.create(
  imdb_id: "tt0299977",
  title: "Hero",
  year: 2002,
  language: "Chinese",
  director_id: director_b.id,
  poster: "https://m.media-amazon.com/images/M/MV5BMWQ2MjQ0OTctMWE1OC00NjZjLTk3ZDAtNTk3NTZiYWMxYTlmXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
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

wish_list_a = WishList.create(name: "Weekend Wishlist", description: Faker::Movies::StarWars.quote, image: "https://yada.org/wp-content/uploads/2018/11/just-in-the-time-for-the-weekend-our-list-of-5-classic-movies-for-a-relaxing-weekend-in.-these-movie.jpg", user_id: user_a.id)
wish_list_b = WishList.create(name: "Working day Wishlist", description: Faker::Movies::StarWars.quote, image: "https://desenio.co.uk/bilder/artiklar/zoom/3464_1.jpg", user_id: user_b.id)
wish_list_c = WishList.create(name: "Holiday Wishlist", description: Faker::Movies::StarWars.quote, image: "https://yada.org/wp-content/uploads/2018/11/just-in-the-time-for-the-weekend-our-list-of-5-classic-movies-for-a-relaxing-weekend-in.-these-movie.jpg", user_id: user_c.id)
wish_list_d = WishList.create(name: "Christmas Wishlist", description: Faker::Movies::StarWars.quote, image: "https://artiks.co.uk/media/catalog/product/cache/a968b8ec7c08ac24e51e551c9f1868e7/1/3/7706/18550/stockholm-vintage-poster.jpg", user_id: user_a.id)
wish_list_e = WishList.create(name: "Summer Wishlist", description: Faker::Movies::StarWars.quote, image: "https://desenio.co.uk/bilder/artiklar/zoom/12001_1.jpg", user_id: user_c.id)
wish_list_f = WishList.create(name: "Winter Wishlist", description: Faker::Movies::StarWars.quote, image: "https://artiks.co.uk/media/catalog/product/cache/a968b8ec7c08ac24e51e551c9f1868e7/1/3/7706/18550/stockholm-vintage-poster.jpg", user_id: user_c.id)
wish_list_g = WishList.create(name: "Sunday Wishlist", description: Faker::Movies::StarWars.quote, image: "https://yada.org/wp-content/uploads/2018/11/just-in-the-time-for-the-weekend-our-list-of-5-classic-movies-for-a-relaxing-weekend-in.-these-movie.jpg", user_id: user_b.id)
wish_list_h = WishList.create(name: "Tonight Wishlist", description: Faker::Movies::StarWars.quote, image: "https://desenio.co.uk/bilder/artiklar/zoom/12001_1.jpg", user_id: user_a.id)
wish_list_i = WishList.create(name: "Lovely Wishlist", description: Faker::Movies::StarWars.quote, image: "https://desenio.co.uk/bilder/artiklar/zoom/12001_1.jpg", user_id: user_b.id)
wish_list_j = WishList.create(name: "Amazing Wishlist", description: Faker::Movies::StarWars.quote, image: "https://desenio.co.uk/bilder/artiklar/zoom/11029_1.jpg", user_id: user_c.id)
wish_list_k = WishList.create(name: "Blue Wishlist", description: Faker::Movies::StarWars.quote, image: "https://artiks.co.uk/media/catalog/product/cache/a968b8ec7c08ac24e51e551c9f1868e7/1/3/7706/18550/stockholm-vintage-poster.jpg", user_id: user_c.id)

wish_list_item_a = WishListItem.create(movie_id: movie_a.id, wish_list_id: wish_list_a.id)
wish_list_item_b = WishListItem.create(movie_id: movie_b.id, wish_list_id: wish_list_b.id)
wish_list_item_c = WishListItem.create(movie_id: movie_c.id, wish_list_id: wish_list_c.id)
wish_list_item_d = WishListItem.create(movie_id: movie_f.id, wish_list_id: wish_list_b.id)
wish_list_item_e = WishListItem.create(movie_id: movie_d.id, wish_list_id: wish_list_a.id)
wish_list_item_f = WishListItem.create(movie_id: movie_c.id, wish_list_id: wish_list_b.id)
wish_list_item_g = WishListItem.create(movie_id: movie_d.id, wish_list_id: wish_list_b.id)
wish_list_item_h = WishListItem.create(movie_id: movie_e.id, wish_list_id: wish_list_c.id)
wish_list_item_i = WishListItem.create(movie_id: movie_f.id, wish_list_id: wish_list_d.id)
wish_list_item_j = WishListItem.create(movie_id: movie_a.id, wish_list_id: wish_list_e.id)
wish_list_item_k = WishListItem.create(movie_id: movie_b.id, wish_list_id: wish_list_f.id)
wish_list_item_l = WishListItem.create(movie_id: movie_a.id, wish_list_id: wish_list_g.id)
wish_list_item_m = WishListItem.create(movie_id: movie_c.id, wish_list_id: wish_list_h.id)
wish_list_item_n = WishListItem.create(movie_id: movie_a.id, wish_list_id: wish_list_i.id)
