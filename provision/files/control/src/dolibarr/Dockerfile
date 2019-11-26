FROM alpine:3.10

# Base install, required packages are listed here: https://wiki.dolibarr.org/index.php/Dependencies_and_external_libraries
RUN set -eux; \
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

ENV DOLI_VERSION 10.0.3

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

COPY src/docker-entrypoint /usr/local/bin
COPY src/apache2-foreground /usr/local/bin
RUN chmod a+x /usr/local/bin/*

ENTRYPOINT ["docker-entrypoint"]

ENV DOLI_URL_ROOT "http://localhost"

CMD ["apache2-foreground"]
