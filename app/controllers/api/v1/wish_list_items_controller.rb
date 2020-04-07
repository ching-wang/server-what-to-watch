require "json"
require "net/http"

class Api::V1::WishListItemsController < ApplicationController
  BASE_URL = "www.omdbapi.com"
  OMDB_KEY = ENV["OMDB_KEY"]

  def index
    if !logged_in?
      protected_action()
      return
    end

    # Select all the wish list items that belong to a wish list that belongs to the user.
    # wish_list_items = WishListItem.joins(:wish_list).where(:wish_lists => { :user_id => @current_user.id })

    wish_lists = WishList.where("user_id = ?", @current_user.id)
    wish_list_items = wish_lists.map { |wl| wl.wish_list_items }.flatten

    render json: wish_list_items
  end

  def create
    if !logged_in?
      protected_action()
      return
    end

    movie = initialise_movie(params[:imdb_id])
    if !movie
      render json: { errors: ["movie not found"] }, status: :not_found
    end

    wish_list_item = WishListItem.find_or_create_by(
      movie_id: movie.id,
      wish_list_id: params[:wish_list_id],
    )

    render json: wish_list_item
  end

  def destroy
    if !logged_in?
      protected_action()
      return
    end

    if !params[:id]
      render json: { errors: ["No wish list item id given"] }, status: :bad_request
      return
    end

    wish_list_item = WishListItem.find_by(id: params[:id])
    if wish_list_item.wish_list.user_id != @current_user.id
      render json: { errors: ["You can't delete other people's wish list items!"] }, status: :unauthorized
      return
    end

    deleted = wish_list_item.destroy
    render json: deleted
  end

  private

  def initialise_movie(imdb_id)
    movie_data = fetch_movie_from_omdb(params[:imdb_id])
    if !movie_data
      return nil
    end

    director = Director.find_or_create_by(name: movie_data["Director"])

    movie = Movie.find_or_initialize_by(imdb_id: params[:imdb_id])
    movie.director_id = director.id
    movie.title = movie_data["Title"]
    movie.year = movie_data["Year"]
    movie.language = movie_data["Language"]
    movie.poster = movie_data["Poster"]
    movie.save

    genres = movie_data["Genre"].split(", ")
    genres.each do |genre_name|
      genre = Genre.find_or_create_by(name: genre_name)
      MovieGenre.find_or_create_by(genre_id: genre.id, movie_id: movie.id)
    end

    return movie
  end

  def fetch_movie_from_omdb(imdb_id)
    result = Net::HTTP.get_response(BASE_URL, "/?apikey=#{OMDB_KEY}&i=#{imdb_id}")
    if result["Error"]
      return nil
    end
    return JSON.parse(result.body)
  end
end
