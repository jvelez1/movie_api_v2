class MoviesController < ApplicationController
  def index
    @movies = Movie.ordered
    render json: @movies, each_serializer: MovieSerializer
  end
end