start:
	@docker-compose up -d

stop:
	@docker-compose down

build:
	@docker-compose build

restart:
	@make stop start

env:
	cp ./.env.example ./.env

ssh-key:
	cp ~/.ssh/id_rsa ./docker/php-fpm/ssh/

php-fpm:
	@docker-compose exec php-fpm $$cmd

yarn:
	@docker-compose exec yarn $$cmd

php-artisan:
	@make php-fpm cmd="php artisan $$cmd"

ssh:
	@make php-fpm cmd="bash"

keygen:
	@make php-artisan cmd="key:generate"

frontend:
	@make php-artisan cmd="site:frontend:build"

truncate:
	@make php-artisan cmd="db:truncate"

migrate:
	@make php-artisan cmd="migrate"

seed:
	@make php-artisan cmd="db:seed"

reset-db:
	@make truncate migrate seed

yarn-install:
	@make yarn cmd="yarn"

yarn-watch:
	@make yarn cmd="yarn run watch"

yarn-dev:
	@make yarn cmd="yarn run dev"

composer-install:
	@make php-fpm cmd="composer install"

phpunit:
	@make php-fpm cmd="vendor/bin/phpunit -c phpunit.xml --log-junit reports/phpunit.xml --coverage-html reports/coverage --coverage-clover reports/coverage.xml"

deploy:
	@make env ssh-key start composer-install keygen migrate seed frontend yarn-install yarn-dev