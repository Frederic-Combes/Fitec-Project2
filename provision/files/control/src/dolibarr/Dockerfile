# FROM debian:buster-slim
FROM php:7.3-apache

RUN apt update && apt install -qqy \
	php7.3-mysqli  	\
	mariadb-client  \
	git

RUN cd /var/www && git clone https://github.com/dolibarr/dolibarr -b 10.0 && chown -R www-data:www-data /var/www

COPY dolibarr.conf /etc/apache2/sites-available/dolibarr.conf

RUN a2dissite 000-default.conf && a2ensite dolibarr.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
