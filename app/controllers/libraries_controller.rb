class LibrariesController < ApplicationController
  def index
    render json: current_user.purchases
  end
end
