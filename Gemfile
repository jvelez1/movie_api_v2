source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3.2'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.2', '>= 1.2.3'
# Use Puma as the app server
gem 'puma', '~> 4.1'

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'devise', '~> 4.8'

gem 'devise-jwt', '~> 0.8.0'

gem 'rack-cors', '~> 1.1', '>= 1.1.1'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false


gem 'active_model_serializers', '~> 0.10.12'

gem 'redis', '~> 4.2', '>= 4.2.5'

gem 'hiredis', '~> 0.6.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'shoulda-matchers', '~> 4.1.0'
  gem 'database_cleaner', '~> 1.7.0'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'faker', '~> 2.10', '>= 2.10.1'
  gem "factory_bot_rails"
  gem 'byebug'
  gem 'awesome_print'
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
