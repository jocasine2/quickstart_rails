<p align="center"><a href="https://rubyonrails.org/" target]="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/1200px-Ruby_On_Rails_Logo.svg.png" width="400"></a></p>

<h1 align="center">Yay! You’re on Rails!</h1>

## Iniciando o docker-compose e atualizando as dependências
```
sudo ./start_development.sh
```
## localhost

[http://localhost:3000/](http://localhost:3000/)

## Front-End
https://github.com/jocasine2/desafio-dev-front-end
<br>

# API

### OPERAÇÃO
#### CRIAR
```
[POST] http://localhost:3000/operations
```
#### PARAMETROS
```
file = CNAB.txt 
```
OU
```
[POST] http://localhost:3000/operations/:id?options[date]=?options[value]=?options[CPF]=?options[card_number]=?options[hour]=?options[owner]=?options[store_name]=?
```
#### EDITAR
```
[PUT]	http://localhost:3000/operations/:id?options[date]=?options[value]=?options[CPF]=?options[card_number]=?options[hour]=?options[owner]=?options[store_name]=?
```	

#### DELETAR
```
[DELETE] http://localhost:3000/operations/:id
```

#### CONSULTAR
```
[GET] http://localhost:3000/operations
```
OU
```
[GET] http://localhost:3000/operations/:id	
```


### TIPO DA TRANSAÇÃO
#### CRIAR
```
[POST] http://localhost:3000/transaction_types?transaction_type[description]=?&transaction_type[nature]=?&transaction_type[signal]=?	
```	
#### EDITAR
```
[PUT] http://localhost:3000/transaction_types?transaction_type[description]=?&transaction_type[nature]=?&transaction_type[signal]=?	
```
#### DELETAR
```
[DELETE] http://localhost:3000/transaction_types/:id
```
#### CONSULTAR
```
[GET] http://localhost:3000/transaction_types
```
OU
```
[GET] http://localhost:3000/transaction_types/:id	
```
