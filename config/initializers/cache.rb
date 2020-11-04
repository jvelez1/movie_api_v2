if Rails.env.development?
  Rails.cache.logger = Logger.new(STDOUT)
end
