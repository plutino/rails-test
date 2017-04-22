FROM ruby:2.3.1-alpine

ARG APP_HOME=/app
ARG PORT=3100

EXPOSE $PORT

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN apk update && apk add build-base mariadb-dev

RUN gem install bundler

COPY Gemfile* ./
RUN bundle install

COPY . .

CMD bundle exec rails c
