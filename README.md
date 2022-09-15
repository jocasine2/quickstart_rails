<p align="center"><a href="https://rubyonrails.org/" target]="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/1200px-Ruby_On_Rails_Logo.svg.png" width="400"></a></p>

<h1 align="center">Yay! You’re on Rails!</h1>

## Iniciando o docker-compose e atualizando as dependências
```
source start_development.sh
```
## localhost

[http://localhost:3000/](http://localhost:3000/)

## logs do container
```
docker attach system_name-app
```

### OPERAÇÃO
#### CRIAR NOVA APLICAÇÃO
```
docker-compose run app rails new ../app
```
#### CRIAR NOVA APLICAÇÃO EM MODO API
```
docker-compose run app rails new ../app --api
```
#### CRIANDO O BANCO DE DADOS
```
docker-compose run app rails db:create
```
