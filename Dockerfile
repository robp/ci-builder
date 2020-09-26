FROM alpine:3.12
RUN apk add --no-cache bash
RUN apk add --no-cache curl
RUN apk add --no-cache openssh
# RUN apk add --no-cache rsync
# RUN apk add --no-cache git
RUN apk add --no-cache nodejs nodejs-npm
RUN apk add --no-cache aws-cli

# Build curl with ssh support
# RUN apk add --no-cache gcc make musl-dev openssl-dev libssh2-dev file
# RUN wget https://curl.haxx.se/download/curl-7.69.1.tar.xz
# RUN tar xfJ curl-7.69.1.tar.xz
# RUN cd curl-7.69.1 && \
#   ./configure --disable-shared --with-libssh2 && \
#   make install

# Install git-ftp
# RUN curl https://raw.githubusercontent.com/git-ftp/git-ftp/master/git-ftp > /usr/local/bin/git-ftp
# RUN chmod 755 /usr/local/bin/git-ftp

# Install php and extensions
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

# Install composer
WORKDIR /usr/local/bin
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');" && \
  ln -s composer.phar composer

# Start bash from /root
WORKDIR /root
CMD ["/bin/bash"]
