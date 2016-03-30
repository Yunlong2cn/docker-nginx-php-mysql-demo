注意，程序运行的当前目录为 /c/Users/Me/docker-nginx-php-mysql-demo，以下操作均以此目录为基础设置，请根据自己的目录来进行相应的修改


# 编译及运行
```
# docker build -t leray/php-fpm .
# docker run -d -p 9000:9000 -v /c/Users/Me/docker-nginx-php-mysql-demo/public:/usr/share/nginx/html --name iphp leray/php-fpm
```



## 安装 mysql 
```
docker pull mysql
docker run -d -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3308:3306 --name imysql mysql
```
其它启动方式
```
# docker run -d -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3308:3306 --name imysql mysql // 启动 无密码mysql
# docker run -d -e MYSQL_USER=leray -e MYSQL_PASSWORD=123456 -p 3308:3306 --name imysql mysql
# docker run -d -v /c/Users/Me/docker-nginx-php-mysql-demo/mysql:/var/lib/mysql -e MYSQL_USER=leray -e MYSQL_PASSWORD=123456 -p 3308:3306 --name imysql mysql // 启动包含用户名密码并挂载外部 data 目录的容器
# docker run -d -v /c/Users/Me/docker-nginx-php-mysql-demo/mysql:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3308:3306 --name imysql mysql
```
根据实际情况，只需要 run 一个即可

## 安装 nginx 
```
docker pull nginx
docker run -it -v /c/Users/Me/docker-nginx-php-mysql-demo/nginx.conf:/etc/nginx/nginx.conf -p 80:80 --name inginx --link iphp --volumes-from iphp nginx
```
其它启动方式
```
# docker run -it -v /c/Users/Me/docker-nginx-php-mysql-demo/nginx.conf:/etc/nginx/nginx.conf -p 80:80 --name inginx --link iphp --volumes-from iphp nginx
# docker run -d -v /c/Users/Me/docker-nginx-php-mysql-demo/nginx.conf:/etc/nginx/nginx.conf -p 80:80 --name inginx --link iphp nginx
```
根据实际情况，只需要 run 一个即可

以上部分必须先启动 php 容器，才可以启动 nginx 容器，此顺序不能颠倒，这里想要运行一个 php 运行环境仍然是比较费力的一件事情，开心的是 docker 提供了 docker-compose 命令，可以一个命令即可完成上述操作，命令为
```
docker-compose up -d
```
值得注意的是：使用 docker-compose 需要 docker-compose.yml (为 docker-compose 执行时自动处理的默认模板文件)，关于 docker-compose 看文档 [YAML 模板文件](https://yeasy.gitbooks.io/docker_practice/content/compose/yaml_file.html)