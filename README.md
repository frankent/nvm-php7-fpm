# nvm-php7-fpm

Docker image for PHP7-FPM + NVM (support `npm ci`)

# How to use

Please put `npm` command at the ending of this command `. /usr/local/nvm/install.sh` by using `&&` style

```SHELL
# Example: Build JS
RUN . /usr/local/nvm/install.sh \
    && npm ci \
    && npm run prod
```

# Package version

```
NVM_VERSION 0.34.0
NODE_VERSION 10.15.1
COMPOSER_VERSION 1.8.4
```

# Extra

This image also add `hirak/prestissimo` to improve composer performance
https://github.com/hirak/prestissimo
