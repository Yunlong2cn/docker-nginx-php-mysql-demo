FROM php:7-fpm
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
	docker-php-ext-install pdo_mysql
RUN	docker-php-ext-configure mysqli --with-mysqli=mysqlnd && \
	docker-php-ext-install mysqli
# RUN	docker-php-ext-configure mysql --with-mysql=mysqlnd && \
#	docker-php-ext-install mysql