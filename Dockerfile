FROM alpine:3.12
RUN apk add --no-cache bash
RUN apk add --no-cache openssh
RUN apk add --no-cache rsync
RUN apk add --no-cache git
RUN apk add --no-cache php7 \
  php7-openssl \
  php7-json \
  php7-phar \
  php7-mbstring \
  php7-iconv \
  php7-tokenizer \
  php7-dom \
  php7-ctype \
  php7-gd \
  php7-pdo \
  php7-session \
  php7-simplexml \
  php7-xml
WORKDIR /usr/local/bin
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN ln -s composer.phar composer
WORKDIR /root
ENTRYPOINT ["bash"]
