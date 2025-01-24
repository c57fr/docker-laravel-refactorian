# Utilisez une image de base pour Laravel (php + apache)
FROM php:8.4-apache

# Mettez à jour les paquets
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Installez les extensions PHP nécessaires
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath

# Copiez le code de votre application dans le conteneur
COPY . /var/www/html

# Définissez les variables d'environnement
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

# Définissez le répertoire de travail
WORKDIR /var/www/html

# Exposez le port 80
EXPOSE 80

# Démarrez Apache
CMD ["apache2-foreground"]
COPY apache2.conf /etc/apache2/apache2.conf
