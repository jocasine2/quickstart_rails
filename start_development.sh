#!/bin/bash
#adicionando funções ao bash
source docker-compose/functions.sh

#iniciando banco de dados
sudo docker-compose up -d

#corrigindo permissões
se_existe ./config/master.key sudo chmod 777 ./config/master.key 
sudo chmod 777 -R "$(pwd)/tmp/db"

#docker-compose run app sed -i "7c CMD exec docker-compose/start.sh" Dockerfile

#reiniciando containers para aplicar as alterações
sudo chmod 777 -R "$(pwd)/tmp/db"
