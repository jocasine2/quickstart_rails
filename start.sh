#!/bin/bash
#adicionando funções ao bash
git submodule update --init --recursive
source submodules/ruby-on-rails/functions.sh

#adicionando usuário ao grupo docker
user_docker

#iniciando banco de dados
sudo docker-compose up -d

#atualizando permissões
permissions_update

#sudo docker-compose up -d postgres

app rails webpacker:install
app bundle
app rails db:drop
app rails db:create
app rails db:migrate
app rails db:seed
