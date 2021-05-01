FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD him.mysql
ENV MYSQL_DATABASE startupreviewdb  
ENV MYSQL _USER himanshu
ENV MYSQL_PASSWORD 1234
ADD startupreviewdb.sql  /docker-entrypoint-initdb.d     
EXPOSE 3306

