FROM php:7.4-apache

# Install PDO MySQL extension and MySQL client
RUN apt-get update && apt-get install -y default-mysql-client \
    && docker-php-ext-install pdo_mysql

# Copy wait script
COPY wait-for-db.sh /usr/local/bin/wait-for-db.sh
RUN chmod +x /usr/local/bin/wait-for-db.sh

# Copy ALL project files to container - make sure challenge directory is included
COPY . /var/www/html/

# Copy challenges directory specifically if it's at the project root
# COPY ../challenge /var/www/html/challenge/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Use wait script as entrypoint
ENTRYPOINT ["/usr/local/bin/wait-for-db.sh"]
CMD ["apache2-foreground"] 