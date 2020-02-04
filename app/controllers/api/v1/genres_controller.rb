class Api::V1::GenresController < ApplicationController

  def index
    genres = Genres.all
  end

end
