#####################################
###                               ###
### MakeFile for Laravel Skeleton ###
###                               ###
#####################################


help: #prints list of commands
	@cat ./makefile | grep : | grep -v "grep"

composer_dep: #install composer dependency >> ./vendors
	@docker run --rm -v $(CURDIR):/app composer install

env: #create env and generate APP key
	@cp .env.example .env && sudo docker-compose exec app php artisan key:generate


#####################################
###                               ###
###       Start/stop project      ###
###                               ###
#####################################

start: #start docker container
	@sudo docker-compose up -d

stop: #stop docker container
	@sudo docker-compose down


#####################################
###                               ###
###       Start/stop project      ###
###                               ###
#####################################

show: #show docker's containers
	@sudo docker ps

connect_db: #Connect
	@docker-compose exec db bash

connect_nodejs: #Connect
	@sudo docker-compose exec nodejs /bin/sh


watch: #Run watch
	@sudo docker-compose exec nodejs npm run watch

tinker: #Run tinker
	@sudo docker-compose exec app php artisan tinker

refresh: #Refresh the database and run all database seeds
	@sudo docker-compose exec app php artisan migrate:refresh --seed
