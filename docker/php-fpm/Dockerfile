FROM php:7.1-fpm

RUN apt-get update \
	&& apt-get install -y git nodejs zlib1g-dev libxml2 libxml2-dev\
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& apt-get install -y libmcrypt-dev libreadline-dev \
	&& docker-php-ext-install -j$(nproc) bcmath calendar fileinfo gettext iconv json mbstring mcrypt pcntl pdo \
	pdo_mysql mysqli soap tokenizer zip

# Xdebub installing
RUN pecl install xdebug && docker-php-ext-enable xdebug