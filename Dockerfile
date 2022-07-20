FROM ruby:2.7.3
LABEL Description="Docker Rails API Base"
WORKDIR /app

RUN gem install bundler

CMD exec bin/start.sh   