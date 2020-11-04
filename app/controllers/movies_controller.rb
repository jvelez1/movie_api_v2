class MoviesController < ApplicationController
  def index
    @movies = Movie.ordered
    render json: @movies.to_json(except: :season_number)
  end
end