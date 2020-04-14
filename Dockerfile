FROM ruby:2.7

LABEL maintainer="caue.guedes91@gmail.com"

RUN apt-get update -yqq && apt-get install -y apt-transport-https

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
    tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    nodejs \
    yarn

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

ENV BUNDLE_PATH /gems

RUN bundle install

COPY . /usr/src/app/

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
