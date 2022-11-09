#!/bin/bash
#adicionando funções ao bash
source docker-compose/functions.sh

#adicionando usuário ao grupo docker
user_docker

#iniciando banco de dados
sudo docker-compose up -d

#atualizando permissões
permissions_update

#sudo docker-compose up -d postgres

app bundle
app rails db:drop
app rails db:create
app rails db:migrate
app rails db:seed
