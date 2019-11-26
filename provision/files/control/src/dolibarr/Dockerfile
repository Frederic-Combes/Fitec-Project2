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
		git \
	; \

RUN cd /var/www && git clone https://github.com/dolibarr/dolibarr -b 10.0 && chown -R www-data:www-data /var/www

COPY dolibarr.conf /etc/apache2/sites-available/dolibarr.conf

RUN a2dissite 000-default.conf && a2ensite dolibarr.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
