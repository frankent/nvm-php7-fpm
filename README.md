# nvm-php7-fpm
Docker image for PHP7-FPM + NVM

# How to use
Please put `npm` command at the ending of this command `. /usr/local/nvm/install.sh` by using `&&` style
```SHELL
# Build JS
RUN . /usr/local/nvm/install.sh \
    && npm ci \
    && npm run prod
```
