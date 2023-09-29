FROM ruby:3.2.1

WORKDIR /app

#instalando bundle
RUN gem install bundler

#instalando node
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - 
RUN apt update && apt install -y nodejs apt-utils

#atualizando node
RUN npm update -g

#instalando yarn
RUN npm install yarn --global

CMD exec docker-compose/start.sh
