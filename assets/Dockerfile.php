FROM php:7.4-fpm

LABEL maintainer Philipp Dittert <philipp.dittert@gmail.com>

RUN apt-get update && apt-get install -y \
        libldap-dev \
    && docker-php-ext-install ldap mysqli pdo pdo_mysql

COPY app /app/

COPY Settings.yaml /app/Configuration/Production/

COPY startup.sh /
RUN chmod +x /startup.sh

WORKDIR /app

STOPSIGNAL SIGQUIT

# override entrypoint
ENTRYPOINT ["/usr/bin/env"]

CMD ["/startup.sh"]

EXPOSE 9000