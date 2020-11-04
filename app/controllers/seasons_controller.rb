class SeasonsController < ApplicationController
  def index
    @seasons = Season.includes(:episodes).ordered
    render json: @seasons.to_json(include: :episodes)
  end
end