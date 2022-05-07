FROM mysql:5.7

VOLUME /var/lib/mysql
VOLUME /docker-entrypoint-initdb.d

COPY ./docker/mysql/car-selling.sql /docker-entrypoint-initdb.d/car-selling.sql

RUN chmod -R 755 /docker-entrypoint-initdb.d
