#iniciando projeto
docker-compose up -d

#adicionando permissão de edição para o usuário atual
sudo chown -R $USER:$USER tmp 


#criando o app
docker-compose run api rails new app --api
docker-compose run api gem install bundler:2.3.13
docker-compose run api bundle install

#para criar um app em modo API
docker-compose run api rails new app --api

#iniciando banco de dados
sudo docker-compose up -d postgres

#criando o banco de dados
docker-compose run api rails db:create
docker-compose run api rails db:migrate
docker-compose run api rails db:seed

#inicia api para mostrando os logs no terminal
sudo docker-compose run --service-ports api
