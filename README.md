# ksxing docker 部署框架
**flask + gunicorn  + mysql + mongo + memcached + nginx** WITH `docker-compose`
## 在部署前的一些准备

```bash
hub clone ksxAppSkeleton
cd ksxAppSkeleton/ksxing
git clone xxxxx #  clone ksxing web code from  repo
cd ..
docker-compose up
```

### compose部署文件样例参考:

* [1.0 compose](https://github.com/realpython/orchestrating-docker/blob/master/docker-compose.yml)
* [2.0 mysql flask uwsgi](https://github.com/KoenR3/docker-nginx-mysql-flask/blob/master/docker-compose.yml)
* [3.0 php and all db](https://github.com/kasperisager/php-dockerized/blob/master/docker-compose.yml)