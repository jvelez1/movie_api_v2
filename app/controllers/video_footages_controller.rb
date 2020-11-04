class VideoFootagesController < ApplicationController
  def index
    @video_footages = VideoFootage.ordered
    render json: @video_footages
  end
end