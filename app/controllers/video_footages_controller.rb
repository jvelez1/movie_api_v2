class VideoFootagesController < ApplicationController
  def index
    @video_footages = VideoFootage.ordered
    render json: @video_footages, each_serializer: VideoFootageSerializer
  end
end