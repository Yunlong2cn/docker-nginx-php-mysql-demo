FROM php:7-fpm
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
	docker-php-ext-install pdo_mysql
RUN	docker-php-ext-configure mysqli --with-mysqli=mysqlnd && \
	docker-php-ext-install mysqli
# RUN	docker-php-ext-configure mysql --with-mysql=mysqlnd && \
#	docker-php-ext-install mysql


# 编译及运行
# docker build -t leray/php-fpm .
# docker run -d -p 9000:9000 -v /c/Users/Me/demo:/usr/share/nginx/html --name iphp leray/php-fpm



##### 安装 mysql #####
# docker pull mysql
# docker run -d -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3308:3306 --name imysql mysql // 启动 无密码mysql
# docker run -d -e MYSQL_USER=leray -e MYSQL_PASSWORD=123456 -p 3308:3306 --name imysql mysql
# docker run -d -v /c/Users/Me/demo/mysql:/var/lib/mysql -e MYSQL_USER=leray -e MYSQL_PASSWORD=123456 -p 3308:3306 --name imysql mysql // 启动包含用户名密码并挂载外部 data 目录的容器
# docker run -d -v /c/Users/Me/demo/mysql:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3308:3306 --name imysql mysql
##### 安装 nginx #####
# docker pull nginx
# docker run -it -v /c/Users/Me/demo/nginx.conf:/etc/nginx/nginx.conf -p 80:80 --name inginx --link iphp --volumes-from iphp nginx
# docker run -d -v /c/Users/Me/demo/nginx.conf:/etc/nginx/nginx.conf -p 80:80 --name inginx --link iphp nginx