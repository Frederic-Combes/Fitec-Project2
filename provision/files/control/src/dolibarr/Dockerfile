# FROM debian:buster-slim

RUN apt update && apt install -qqy \
	php7.3  				\
	php7.3-mysql  	\
	php7.3-mysqli  	\
	php7.3-curl  		\
	php7.3-gd 			\
	php7.3-ldap  		\
	php7.3-intl  		\
	php-pear  			\
	php-mail-mime  	\
	xdg-utils 	 		\
	mariadb-client  \
 	apache2					\
	git

RUN cd /var/www && git clone https://github.com/dolibarr/dolibarr -b 10.0 && chown -R www-data:www-data /var/www

COPY dolibarr.conf /etc/apache2/sites-available/dolibarr.conf

RUN a2dissite 000-default.conf && a2ensite dolibarr.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
