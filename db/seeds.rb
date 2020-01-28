
user_a = User.create(username: "Qing", email: "qing@gmail.com", password: "123456")
user_b = User.create(username: "Tom", email: "tom@gmail.com", password: "helloworld")
user_c = User.create(username: "Sergio", email: "sergio@gmail.com", password: "iamsergio")

genre_a = Genre.create(name: "action")
genre_b = Genre.create(name: "horror")
genre_c = Genre.create(name: "comedy")
genre_d = Genre.create(name: "adventure")
genre_e = Genre.create(name: "crime")

director_a = Director.create(name: "Todd Philips")
director_b = Director.create(name: "J.J.Abrams")
director_c = Director.create(name: "Rian Johnson")

movie_a = Movie.create(title: "joker", director_id: director_a.id)
movie_b = Movie.create(title: "star wars: The Rise of Skywalker", director_id: director_b.id)
movie_c = Movie.create(title: "Knives Out", director_id: director_c.id)

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
