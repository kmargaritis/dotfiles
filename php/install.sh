#!/usr/bin/env bash

brew install automake autoconf pcre bison re2c mhash libtool icu4c gettext jpeg openssl libxml2 gmp libevent libiconv bzip2 libzip curl zlib
brew link icu4c
brew link --force openssl
brew link --force libxml2


curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar
chmod +x phpbrew.phar
sudo mv phpbrew.phar /opt/homebrew/bin/phpbrew

phpbrew init

source ~/.phpbrew/bashrc

#
if ! phpbrew  list | grep "8.0.30"; then
    phpbrew install -j $(sysctl -n hw.ncpu) 8.0.30 +default +mysql +fpm +openssl=`brew --prefix openssl@1.1` +iconv="$(brew --prefix libiconv)" +bz2="$(brew --prefix bzip2)" +zlib="$(brew --prefix zlib)" -- --with-external-pcre=$(brew --prefix pcre2)
fi

if ! phpbrew  list | grep "8.1.27"; then
    phpbrew install -j $(sysctl -n hw.ncpu) 8.1.27 +default +mysql +fpm +openssl=`brew --prefix openssl` +iconv="$(brew --prefix libiconv)" +bz2="$(brew --prefix bzip2)" +zlib="$(brew --prefix zlib)"
fi

if ! phpbrew  list | grep "8.2.18"; then
    phpbrew install -j $(sysctl -n hw.ncpu) 8.2.18 +default +mysql +fpm +openssl=`brew --prefix openssl` +iconv="$(brew --prefix libiconv)" +bz2="$(brew --prefix bzip2)" +zlib="$(brew --prefix zlib)"
fi

phpbrew use 8.2.18

#brew install virtphp
# wget -O virtphp  https://github.com/virtphp/virtphp/releases/download/v0.5.1-alpha/virtphp.phar
# chmod +x virtphp
# mv virtphp $HOME/bin/virtphp
# virtphp create dev

# source ~/.virtphp/envs/dev/bin/activate

# http://uk1.php.net/get/php-5.4.43.tar.bz2/from/a/mirror
