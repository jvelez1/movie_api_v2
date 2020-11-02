FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /movie_api_v2
WORKDIR /movie_api_v2
COPY Gemfile /movie_api_v2/Gemfile
COPY Gemfile.lock /movie_api_v2/Gemfile.lock
RUN bundle install
COPY . /movie_api_v2

# Add a script to be executed every time the container starts.
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]