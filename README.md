# 注意，程序运行的当前目录为 /c/Users/Me/docker-nginx-php-mysql-demo，以下操作均以此目录为基础设置，请根据自己的目录来进行相应的修改


# 编译及运行
# docker build -t leray/php-fpm .
# docker run -d -p 9000:9000 -v /c/Users/Me/docker-nginx-php-mysql-demo/public:/usr/share/nginx/html --name iphp leray/php-fpm



##### 安装 mysql #####
# docker pull mysql
# docker run -d -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3308:3306 --name imysql mysql // 启动 无密码mysql
# docker run -d -e MYSQL_USER=leray -e MYSQL_PASSWORD=123456 -p 3308:3306 --name imysql mysql
# docker run -d -v /c/Users/Me/docker-nginx-php-mysql-demo/mysql:/var/lib/mysql -e MYSQL_USER=leray -e MYSQL_PASSWORD=123456 -p 3308:3306 --name imysql mysql // 启动包含用户名密码并挂载外部 data 目录的容器
# docker run -d -v /c/Users/Me/docker-nginx-php-mysql-demo/mysql:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3308:3306 --name imysql mysql
##### 安装 nginx #####
# docker pull nginx
# docker run -it -v /c/Users/Me/docker-nginx-php-mysql-demo/nginx.conf:/etc/nginx/nginx.conf -p 80:80 --name inginx --link iphp --volumes-from iphp nginx
# docker run -d -v /c/Users/Me/docker-nginx-php-mysql-demo/nginx.conf:/etc/nginx/nginx.conf -p 80:80 --name inginx --link iphp nginx