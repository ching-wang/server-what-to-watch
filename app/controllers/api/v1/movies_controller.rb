require "json"
require "net/http"

class Api::V1::MoviesController < ApplicationController
  BASE_URL = "www.omdbapi.com"
  OMDB_KEY = ENV["OMDB_KEY"]

  def show
    movie_data = fetch_movie_from_omdb(params[:imdb_id])
    if not movie_data
      render json: { errors: ["Not found"] }, status: :not_found
      return
    end
    render json: movie_data
  end

  private

  def fetch_movie_from_omdb(imdb_id)
    result = Net::HTTP.get_response(BASE_URL, "/?apikey=#{OMDB_KEY}&i=#{imdb_id}")
    if result["Error"]
      return nil
    end
    return JSON.parse(result.body)
  end
end
