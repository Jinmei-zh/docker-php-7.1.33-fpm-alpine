FROM php:7.1.33-fpm-alpine
RUN apk update && apk upgrade
RUN apk add bash
RUN apk add librdkafka-dev
RUN apk add --no-cache --virtual .build-deps \
    g++ make autoconf
RUN pecl install rdkafka-2.0.1 \
	  && docker-php-ext-enable rdkafka
RUN pecl install redis-5.1.1 \
	&& docker-php-ext-enable redis
RUN docker-php-ext-install pdo_mysql 
CMD ["php-fpm"]