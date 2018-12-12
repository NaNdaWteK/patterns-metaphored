FROM ruby:2.5.3

WORKDIR /patterns

ADD . /patterns

RUN gem install bundle
