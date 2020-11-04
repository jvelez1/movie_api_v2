class SeasonsController < ApplicationController
  def index
    @seasons = Season.includes(:episodes).ordered
    render json: @seasons, each_serializer: SeasonSerializer
  end
end