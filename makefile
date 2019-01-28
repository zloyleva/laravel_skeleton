#####################################
###                               ###
### MakeFile for Laravel Skeleton ###
###                               ###
#####################################


help: #prints list of commands
	@cat ./makefile | grep : | grep -v "grep"

composer_dep: #install composer dependency >> ./vendors
	@sudo docker run --rm -v $(CURDIR):/app composer install

start: #start docker container
	@sudo docker-compose up -d

stop: #stop docker container
	@sudo docker-compose down

tinker: #Run tinker
	@sudo docker-compose exec app php artisan tinker

refresh: #Refresh the database and run all database seeds
	@sudo docker-compose exec app php artisan migrate:refresh --seed
