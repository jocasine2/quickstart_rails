#!/bin/bash

#funções uteis

function app(){
    docker-compose run app $@
}

function new_app(){
    app rails new ../app
}

function app_reset(){
    permissions_update
    remove_app
    new_app
}

function app_scaffold_api(){
    docker-compose run app rails g scaffold $@ --api
}

function bd(){
    docker-compose run bd $@
}

function remove_app(){
    permissions_update

    #para remover o app criado 
    rm -rf bin 
    rm -rf config 
    rm -rf db 
    rm -rf lib 
    rm -rf log 
    rm -rf public 
    rm -rf storage 
    rm -rf test 
    rm -rf tmp 
    rm -rf vendor 
    rm -rf app 
    rm -rf .gitattributes 
    rm -rf config.ru 
    rm -rf Gemfile.lock  
    rm -rf package.json 
    rm -rf Rakefile 
    rm -rf .ruby-version 
    rm -rf Gemfile
}

function migrate(){
    app rails db:drop db:create db:migrate db:seed
}

function permissions_update(){
    sudo chown -R $USER:$USER .
}

function prune(){
    docker system prune -a -f
}

function build_project(){
    app_reset

    app_scaffold_api unit name:string
    app_scaffold_api localization longitude:string latitude:string
    app_scaffold_api store name:string localization:references
    app_scaffold_api list name:string date_time:date store:references
    app_scaffold_api item name:string list:references
    app_scaffold_api itemlist item:references list:references default:boolean unit:references
    app_scaffold_api priceperunitofmeasure quantity:float unit:references
    app_scaffold_api product description:string unit:references packagingquantity:float price:float
    app_scaffold_api productitem item:references product:references
    app_scaffold_api storeproduct store:references product:references

    docker-compose up -d

    app rails db:create
    app rails db:migrate
}

function destroy_project(){
    remove_app
    docker-compose down
    prune
}

function restart(){
    docker-compose down
    prune
    ./start_development.sh
    docker attach vale_gas-app
}

function se_existe(){
    file=$1
    if [ -f "$file" ]
    then
        $2
    fi
}

function Welcome(){
    echo funções carregadas!
}

Welcome
