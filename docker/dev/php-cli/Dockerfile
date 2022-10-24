FROM php:8.1-cli-alpine as cli

ENV APP_MODE development

RUN apk add --no-cache autoconf g++ make \
    && pecl install xdebug \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug

RUN apk add --no-cache unzip wget bash

RUN docker-php-ext-install pdo pdo_mysql

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

COPY ${pwd}/docker/dev/php/conf.d /usr/local/etc/php/conf.d
ENV COMPOSER_ALLOW_SUPERUSER 1

WORKDIR /var/www/html

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

FROM cli
COPY ./ /var/www/html

WORKDIR /var/www/html
