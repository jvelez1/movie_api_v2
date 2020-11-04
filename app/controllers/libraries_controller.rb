class LibrariesController < ApplicationController
  def index
    render json: user.purchases
  end

  private

  def user
    @user = User.find_by(id: params[:user_id])
  rescue => _e
    render status: :not_found
  end
end
