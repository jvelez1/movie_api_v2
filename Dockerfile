FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /api
WORKDIR /api
COPY Gemfile /api/Gemfile
COPY Gemfile.lock /api/Gemfile.lock
RUN bundle install
COPY . /api

# Add a script to be executed every time the container starts.
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]