#adicionando funções ao bash
my_dir="$(pwd)"
$my_dir/docker-compose/functions.sh

#iniciando banco de dados
sudo docker-compose up -d

#corrigindo permissões
sudo chmod 777 "$(pwd)/config/master.key"
sudo chmod 777 -R "$(pwd)/tmp/db"

docker-compose run app sed -i "7c CMD exec docker-compose/start.sh" Dockerfile

#reiniciando containers para aplicar as alterações
sudo chmod 777 -R "$(pwd)/tmp/db"