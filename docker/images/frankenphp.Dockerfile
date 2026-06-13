FROM dunglas/frankenphp:1.12.2-php8.4 AS backend_server

ARG COMPOSER_VERSION=2.9.8
ARG APP_ENV=prod
RUN apt-get update && apt-get install -y \
    bash \
    unzip \
    && rm -rf /var/lib/apt/lists/*
RUN touch ~/.bashrc && echo "export HISTCONTROL=ignoredups" >> ~/.bashrc

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=${COMPOSER_VERSION} --filename=composer

RUN install-php-extensions \
    amqp \
    bcmath \
    brotli \
    exif \
    ffi \
	gd \
	intl \
    pcntl \
	pdo_pgsql \
    mbstring \
	opcache \
    redis \
    vips \
	zip