class LibrariesController < ApplicationController
  def index
    render json: user.purchases
  end
end
