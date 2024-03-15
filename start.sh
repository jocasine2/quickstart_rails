#!/bin/bash
#adicionando funções ao bash
source submodules/ruby-on-rails/functions.sh

#adicionando usuário ao grupo docker
user_docker

#iniciando banco de dados
sudo docker-compose up -d

#atualizando permissões
permissions_update

#sudo docker-compose up -d postgres

app rails webpacker:install
app rails tailwindcss:build
app rails tailwindcss:install

app bundle
app rails db:drop
app rails db:create
app rails db:migrate
app rails db:seed
