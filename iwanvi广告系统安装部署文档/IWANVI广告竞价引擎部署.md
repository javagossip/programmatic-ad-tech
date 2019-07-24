# 广告竞价引擎部署
项目模块：nvwa-adserv-ngx/nvwa-adserv-ngx-server
## 修改环境配置文件
src/main/assembly/filters/${env.id}/filter.properties, 其中env.id环境变量参见pom.xml中的profile配置，目前包括dev,test,prod三个

## 配置文件说明  
```java  
db.path=/data/nvwa/db/
notify.msg.topic=minerva
env.dev=0

local.file.path=/data/nvwa/pub
media.dspid=M7nuyi
media.internal.uuid=M7nuyi
dsp.router.threadpool.min-size=1024
dsp.router.threadpool.max-size=1024

//dsp超时时间
dsp.timeout=250
//默认redis服务器相关配置
redis.default.host=r-2zemcvnzvf8a27hv6p.redis.rds.aliyuncs.com:6379
redis.default.maxActive=20
redis.default.connectTimeout=3000
redis.default.soTimeout=10
redis.default.auth=2019@iwanvi_redis
redis.default.db=0
//限速redis相关配置
redis.ratelimit.host=r-2zemcvnzvf8a27hv6p.redis.rds.aliyuncs.com:6379
redis.ratelimit.maxActive=5
redis.ratelimit.connectTimeout=3000
redis.ratelimit.soTimeout=5
redis.ratelimit.auth=2019@iwanvi_redis
redis.ratelimit.db=0
    
//各家对接dsp相关配置
toutiao.dspid=toutiao
toutiao.appid=5014839
toutiao.ekey=1c3c324024e3457b8573fdf26d31a903
toutiao.ikey=40ef1bdcbd7b410e1407ebdd0ed49574

360.dspid=360

ruangao.dspid=NFbqiu
ruangao.mediaid=800156
ruangao.medianame=\u4E2D\u6587\u4E07\u7EF4
ruangao.interfaceversion=1.6.3

iflytek.dspid=2MFfYj
iflytek.ekey=5120aba7dd8880ba

youdao.dspid=qiU3U3
inmobi.dspid=IJJJRf
adview.dspid=6jE3Mv
adngx.server.count=10

maihan.dspid=neQj22
maihan.apiver=V2.1

adwo.dspid=nmiqIb

liebao.dspid=2UvmIj
liebao.ekey=vl7z58b6vegfe3f3oaialx6oun4yxmkl

```

## 打包部署  
```bash
mvn clean package -P${env.id} -pl nvwa-adserv-ngx/nvwa-adserv-ngx-server -am  
```

到nvwa-adserv-ngx/nvwa-adserv-ngx-server/target目录下面，拷贝nvwa-adserv-ngx-server-${env.id}.tar.gz到服务器的指定目录下，如:/data/apps/nvwa-adserv-ngx-server

## 启动

```bash
cd /data/apps/nvwa-adserv-ngx-server  
tar xzvf nvwa-adserv-ngx-server-${env.id}.tar.gz  
cd nvwa-adserv-ngx-server-${env.id}
bash ./run.sh

```

# nvwa-openapi-adx模块部署
项目模块：nvwa-openapi/nvwa-openapi-adx  
## 环境相关配置文件：  
src/main/resources/application-${env.id}.properties  

## 配置文件说明  

``` 
spring.datasource.url=mysql数据库地址  
spring.datasource.username=数据库用户名    
spring.datasource.password=数据库密码  
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
spring.datasource.max-active=连接池大小      

//redis相关配置，按照具体环境进行配置    
redis.host=182.92.173.117  
redis.port=2917  
redis.database=7  
redis.timeout=60000  
redis.auth=2917  
//服务端口地址，默认18888  
dorado.server.port=18888
```

## 打包部署  

```
mvn clean package -P${env.id} -pl nvwa-openapi/nvwa-openapi-adx -am   
```
到nvwa-adserv-ngx/nvwa-adserv-ngx-server/target目录下面，拷贝nvwa-openapi-adx-${env.id}.tar.gz到服务器的指定目录下，如:/data/apps/nvwa-openapi-adx

## 启动  

```bash
cd /data/apps/nvwa-openapi-adx  
tar xzvf nvwa-openapi-adx-${env.id}.tar.gz  
cd nvwa-openapi-adx-${env.id}  
bash ./run.sh 
```

## 

