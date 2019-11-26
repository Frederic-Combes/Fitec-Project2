FROM alpine:3.10

ENV DOLI_VERSION 10.0.3

RUN set -eux; \
	# install needed packages
	# see https://wiki.dolibarr.org/index.php/Dependencies_and_external_libraries
	apk add --no-cache \
		bash \
		openssl \
		rsync \
		apache2 \
		php7-apache2 \
		php7-session \
		php7-mysqli \
		php7-pgsql \
		php7-ldap \
		php7-mcrypt \
		php7-openssl \
		php7-mbstring \
		php7-intl \
		php7-gd \
		php7-imagick \
		php7-soap \
		php7-curl \
		php7-calendar \
		php7-xml \
		php7-zip \
		php7-tokenizer \
		php7-simplexml \
		php7 \
		mariadb-client \
		postgresql-client \
		unzip \
	; \
	install -d -o apache -g root -m 0750 /var/www/html; \
	rm -rf /var/www/localhost/htdocs; \
	ln -s /var/www/html /var/www/localhost/htdocs

VOLUME /var/www/html
VOLUME /var/www/documents

# Get Dolibarr
ADD https://github.com/Dolibarr/dolibarr/archive/${DOLI_VERSION}.zip /tmp/dolibarr.zip
#COPY /dolibarr-${DOLI_VERSION}.zip /tmp/dolibarr.zip
RUN set -eux; \
	unzip -q /tmp/dolibarr.zip -d /tmp/dolibarr; \
	rm -f /tmp/dolibarr.zip; \
	mkdir -p /usr/src/dolibarr; \
	cp -r /tmp/dolibarr/dolibarr-${DOLI_VERSION}/* /usr/src/dolibarr; \
	rm -rf /tmp/dolibarr; \
	chmod +x /usr/src/dolibarr/scripts/*

WORKDIR /var/www/html

EXPOSE 80/tcp

COPY /src/docker-entrypoint /usr/local/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]

COPY /src/apache2-foreground /usr/local/bin/apache2-foreground
CMD ["apache2-foreground"]

# FROM debian:buster-slim

# RUN apt update && apt install -qqy \
# 	php7.3  				\
# 	php7.3-mysql  	\
# 	php7.3-mysqli  	\
# 	php7.3-curl  		\
# 	php7.3-gd 			\
# 	php7.3-ldap  		\
# 	php7.3-intl  		\
# 	php-pear  			\
# 	php-mail-mime  	\
# 	xdg-utils 	 		\
# 	mariadb-client  \
# 	apache2					\
# 	git

# RUN cd /var/www && git clone https://github.com/dolibarr/dolibarr -b 10.0 && chown -R www-data:www-data /var/www

# COPY dolibarr.conf /etc/apache2/sites-available/dolibarr.conf

# RUN a2dissite 000-default.conf && a2ensite dolibarr.conf

# EXPOSE 80

# CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
