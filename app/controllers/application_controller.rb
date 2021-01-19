class ApplicationController < ActionController::API
  before_action :track_activity

  def user
    @user = User.find_by(id: params[:user_id])
  rescue => _e
    render status: :not_found
  end

  private

  def track_activity
    ActivityLog.transaction do
      log = ActivityLog.find_or_create_by(path: request.path, user_id: user.id)
      log.lock!
      log.increment!(:counter)
    end
  end
end
