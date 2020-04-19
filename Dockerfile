FROM ruby:2.7.0
RUN apt update -qq && apt install -y build-essential libpq-dev nodejs
RUN mkdir /articles-api
WORKDIR /articles-api

COPY Gemfile /articles-api/Gemfile
COPY Gemfile.lock /articles-api/Gemfile.lock

RUN gem install bundler:2.1.4
RUN bundle update --bundler
RUN bundle install

COPY . /articles-api