FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y postgresql-client
RUN bundle config --global frozen 1

WORKDIR /articles-api

COPY Gemfile /articles-api/Gemfile
COPY Gemfile.lock /articles-api/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]