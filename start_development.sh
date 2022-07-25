#iniciando banco de dados
sudo docker-compose up -d

#corrigindo permissões
sudo chmod 777 /home/joaquim/Sistemas/desafio_dev_rails_angular/quickstart_rails/config/master.key
sudo chmod 777 -R /home/joaquim/Sistemas/desafio_dev_rails_angular/quickstart_rails/tmp/db

docker-compose run app sed -i "7c CMD exec docker-compose/start.sh" Dockerfile

#reiniciando containers para aplicar as alterações
sudo chmod 777 -R /home/joaquim/Sistemas/desafio_dev_rails_angular/quickstart_rails/tmp/db


#para remover o app criado
# sudo rm -rf bin
# sudo rm -rf config
# sudo rm -rf db
# sudo rm -rf lib
# sudo rm -rf log
# sudo rm -rf public
# sudo rm -rf storage
# sudo rm -rf test
# sudo rm -rf tmp
# sudo rm -rf vendor
# sudo rm -rf app
