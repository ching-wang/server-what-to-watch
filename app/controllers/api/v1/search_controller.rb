require "net/http"

class Api::V1::SearchController < ApplicationController
  BASE_URL = "www.omdbapi.com"
  OMDB_KEY = ENV["OMDB_KEY"]

  def index
    if params[:s].present?
      search_query = params[:s]
        .gsub(/[^a-zA-Z0-9\s]/, "")
        .split(/\s+/)
        .slice(0, 10)
        .join("+")
      results_page = params[:page] ? params[:page] : 1
      search_results = Net::HTTP.get(
        BASE_URL,
        "/?apikey=#{OMDB_KEY}&s=#{search_query}&page=#{results_page}"
      )
      render json: search_results
      return
    end
    render json: { errors: ["Must provide a search term, film/TV show name or genre"] }, status: :bad_request
  end
end
