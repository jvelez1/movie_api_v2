class ActivityLogMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    status, headers, response = @app.call(env)

    token = headers['Authorization'] || req.fetch_header('HTTP_AUTHORIZATION')
    user = User.find_by_token(token)

    if user
      ActivityLog.transaction do
        log = ActivityLog.find_or_create_by(path: req.path_info, user_id: user.id)
        log.lock!
        log.increment!(:counter)
      end
    end

    [status, headers, response]
  end
end
