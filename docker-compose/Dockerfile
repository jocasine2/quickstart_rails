FROM ruby:2.7.3
LABEL Description="Docker Rails Base"
WORKDIR /app

RUN gem install bundler

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - 
RUN apt-get update && apt-get install -y nodejs apt-utils

#atualizando pacotes npm
RUN npm update -g

#instalando yarn
RUN npm install yarn --global

CMD exec docker-compose/start.sh
