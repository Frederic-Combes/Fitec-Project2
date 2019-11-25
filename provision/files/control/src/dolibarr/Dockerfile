FROM debian:buster-slim

COPY dolibarr-10.0.3.tgz .

RUN apt update && apt install -qqy php7.3 php7.3-mysql php7.3-mysqli php7.3-curl php7.3-gd php7.3-ldap php7.3-intl php-pear php-mail-mime xdg-utils mariadb-client apache2 \
	&& mkdir /var/www/html/dolibarr \
	&& tar -xzf dolibarr-10.0.3.tgz -C /var/www/html/ --strip-components=1 \
	&& rm -rf dolibarr-10.0.3.tgz \
	&& mv /var/www/html/htdocs/* /var/www/html/dolibarr \
	&& chown -R www-data:www-data /var/www/html/ \
	&& echo "ServerName localhost" >> /etc/apache2/apache2.conf \
	&& echo "DocumentRoot /var/www/html/dolibarr" >> /etc/apache2/apache2.conf \
	#&& useradd -m -g www-data -s /bin/bash dolibarr \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 80
#USER dolibarr

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
