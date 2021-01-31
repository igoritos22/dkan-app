###author: Igor Luiz de Sousa Santos####

#Ubuntu Based##
FROM ubuntu:18.04


#Install all packages Apache&Php
RUN apt-get update && apt-get update && apt-get install apache2 -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install php libapache2-mod-php -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    DEBIAN_FRONTEND=noninteractive apt-get install php7.2 -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install php7.2-dev php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-opcache php7.2-mysql php7.2-mbstring php7.2-zip php7.2-xml php7.2-xdebug php7.2-dom -y

#Change directory to work
WORKDIR /var/www/html/

#Git clone the dekan repository and all configuratios
RUN apt-get install git -y && \
    git clone https://github.com/GetDKAN/dkan-drops-7.git && \
    mkdir -p /var/www/html/dkan-drops-7/sites/default/files && \
    cp /var/www/html/dkan-drops-7/sites/default/default.settings.php /var/www/html/dkan-drops-7/sites/default/settings.php && \
    rm -rf index.html && \
    cd dkan-drops-7/ && \
    cp * -r /var/www/html/ && \
    rm -rf dkan-drops-7/ && \
    chmod a+w /var/www/html/sites/default/files/ && \
    chmod 777 /var/www/html/sites/default/settings.php

EXPOSE 80 443

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

####References to build this Dockerfile#####
##https://medium.com/@supunbandara06/how-to-deploy-the-dkan-product-on-an-aws-ec2-ccacc667f065###