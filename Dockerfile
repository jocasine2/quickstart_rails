FROM ruby:2.7.3
LABEL Description="Docker Rails Base"
WORKDIR /app

RUN gem install bundler

CMD exec docker-compose/start.sh
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt-get install -y nodejs

CMD exec docker-compose/start.sh
