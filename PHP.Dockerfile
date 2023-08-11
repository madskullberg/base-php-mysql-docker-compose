FROM php:8.1-apache

RUN docker-php-ext-install pdo pdo_mysql

RUN docker-php-ext-install mysqli

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN a2enmod rewrite
RUN a2enmod negotiation

# Update apt-get list
RUN apt-get update -y

# YAML 
# RUN apt-get install libyaml-dev -y
# RUN pecl install yaml && echo "extension=yaml.so" > /usr/local/etc/php/conf.d/ext-yaml.ini && docker-php-ext-enable yaml

# Install git
RUN apt-get -y install git

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    imagemagick libmagickwand-dev --no-install-recommends \
    && pecl install imagick
    
RUN docker-php-ext-enable imagick

RUN docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype
RUN docker-php-ext-install gd

ENV PHP_MEMORY_LIMIT=128M