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
      search_results = Net::HTTP.get(BASE_URL, "/?apikey=#{OMDB_KEY}&s=#{search_query}")
      render json: search_results
      return
    end
    render json: { errors: ["Must provide s query"] }, status: :bad_request
  end
end
