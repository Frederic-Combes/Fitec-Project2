FROM php:7.3-apache
#FROM debian:buster-slim

#	php7.3  				\
#	php7.3-mysql  	\
#	php7.3-mysqli  	\
#	php7.3-curl  		\
#	php7.3-gd 			\
#	php7.3-ldap  		\
#	php7.3-intl  		\
#	php-pear  			\
#	php-mail-mime  	\

RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr		\
	&& docker-php-ext-install mysqli pdo pdo_mysql gd soap zip

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ 			\
    && docker-php-ext-install ldap

RUN apt update && apt install -qqy												\
	xdg-utils 	 																\
	mariadb-client  															\
 	apache2																		\
	git

RUN cd /var/www && git clone https://github.com/dolibarr/dolibarr -b 10.0 && chown -R www-data:www-data /var/www

COPY dolibarr.conf /etc/apache2/sites-available/dolibarr.conf

RUN a2dissite 000-default.conf && a2ensite dolibarr.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
