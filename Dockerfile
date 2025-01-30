FROM php:8.2-apache as final
RUN docker-php-ext-install pdo pdo_mysql
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# COPY vendor/ /var/www/html/vendor
COPY . /var/www/html
RUN cat apache.conf /etc/apache2/apache2.conf
USER www-data
