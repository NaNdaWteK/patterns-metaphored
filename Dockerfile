FROM ruby:2.4.2

WORKDIR /patterns

ADD . /patterns

RUN gem install bundle
