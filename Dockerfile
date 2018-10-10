FROM ubuntu:16.04

LABEL maintainer="asnawi saharuddin"

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2 \
    software-properties-common \
    python-software-properties \
    curl \
    apt-utils \
	&& apt-get clean \
	&& rm -fr /var/lib/apt/lists/*

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -y --no-install-recommends \
                libapache2-mod-php5.6 \
                php5.6 \
                php5.6-cli \
                php5.6-curl \
                php5.6-dev \
                php5.6-gd \
                php5.6-imap \
                php5.6-mbstring \
                php5.6-mcrypt \
                php5.6-mysql \
                php5.6-xml \
                php5.6-xmlrpc \
                php-pear \
        && apt-get clean \
        && rm -fr /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g bower

# Install composer for PHP dependencies
RUN cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN a2enmod rewrite
