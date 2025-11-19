FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    git unzip libpng-dev libjpeg-dev libpq-dev mariadb-client libicu-dev libzip-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install gd mysqli intl opcache zip
    && docker-php-ext-install soap

# Download IOMAD
RUN git clone https://github.com/IOMAD/iomad.git /var/www/html

# Create moodledata with correct permissions
RUN mkdir -p /var/www/moodledata \
    && chown -R www-data:www-data /var/www/moodledata \
    && chmod -R 0777 /var/www/moodledata \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
