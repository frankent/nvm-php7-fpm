FROM php:7-fpm

ENV NVM_VERSION         0.34.0
ENV NODE_VERSION        10.15.1
ENV COMPOSER_VERSION    1.8.4

ENV NVM_DIR     /usr/local/nvm
ENV NODE_PATH   $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH        $NVM_DIR/v$NODE_VERSION/bin:$PATH

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN mkdir $NVM_DIR

# Install base dependencies
RUN apt-get update && apt-get install -y -q --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl-dev \
    libpng-dev \
    wget \
    zip \
    unzip \
    cron \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
    && wget https://getcomposer.org/download/$COMPOSER_VERSION/composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer global require hirak/prestissimo

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
