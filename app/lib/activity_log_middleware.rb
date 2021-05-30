class ActivityLogMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    ActivityLog.transaction do
      log = ActivityLog.find_or_create_by(path: req.path_info, user_id: req.params['user_id'])
      log.lock!
      log.increment!(:counter)
    end

    status, headers, response = @app.call(env)
    [status, headers, response]
  end
end
