FROM debian:11

RUN apt-get update -y
RUN apt-get upgrade -y --force-yes
RUN apt-get install apt-transport-https lsb-release ca-certificates wget -y
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get update -y
RUN apt-get install apache2 curl git openssl vim -y --allow-unauthenticated
RUN apt-get install php php-common php-gd php-curl php-cli php-xml -y --allow-unauthenticated
RUN apt-get install sqlite3 php-sqlite3 php-intl openssl php-zip php-mbstring php-bz2 -y --allow-unauthenticated
RUN apt-get install php-fpm php-pgsql php-mysql -y --allow-unauthenticated

RUN git clone https://github.com/mapbender/mapbender-starter.git /var/www/mapbender
RUN cd /var/www/mapbender; ./bootstrap

RUN chown -R www-data:www-data /var/www/mapbender
RUN chmod -R ugo+r /var/www/mapbender
RUN chmod -R ug+w /var/www/mapbender/application/web/uploads
# need check path after build steps
RUN chmod ug+w /var/www/mapbender/application/app/db/
#RUN chmod ug+x /var/www/mapbender/application/vendor/eslider/sasscb/dist/sassc
#RUN chmod ug+x /var/www/mapbender/application/vendor/wheregroup/sassc-binaries/dist/sassc

RUN a2enmod rewrite
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
RUN rm /etc/apache2/sites-enabled/*

COPY ./default.conf /etc/apache2/sites-enabled/mapbender.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
