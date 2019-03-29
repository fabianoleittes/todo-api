FROM ruby:2.6.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ENV APP_HOME /todo-api
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . $APP_HOME

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]