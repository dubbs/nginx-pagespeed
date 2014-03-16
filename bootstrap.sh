#!/usr/bin/env bash

apt-get update
sudo apt-get install unzip build-essential zlib1g-dev libpcre3 libpcre3-dev
cd ~
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-1.7.30.4-beta.zip
unzip release-1.7.30.4-beta.zip
cd ngx_pagespeed-release-1.7.30.4-beta/
wget https://dl.google.com/dl/page-speed/psol/1.7.30.4.tar.gz
tar -xzvf 1.7.30.4.tar.gz
cd ~
wget http://nginx.org/download/nginx-1.4.4.tar.gz
tar -xvzf nginx-1.4.4.tar.gz
cd nginx-1.4.4/
./configure --add-module=$HOME/ngx_pagespeed-release-1.7.30.4-beta
make
sudo make install

rm -rf /var/www
rm -rf /usr/local/nginx/conf/nginx.conf

ln -fs /vagrant/public /var/www
ln -fs /vagrant/nginx.conf /usr/local/nginx/conf/nginx.conf

# start nginx
cd /usr/local/nginx/sbin
sudo ./nginx

