[<< Back](README.md)

# Docker

for install docker on Ubuntu visit [link](https://docs.docker.com/engine/install/ubuntu/) 

### Get all containers

```bash
$ docker ps -a
```

### Remove container

```bash
$ docker remove postgresql
```

### Rename container

```bash
$ docker rename old_name new_name
```

### Start, stop and restart container

```bash
$ docker start postgresql
```

```bash
$ docker stop postgresql
```

```bash
$ docker restart postgresql
```

### Show container logs

```bash
$ docker logs postgresql
```

## Docker container auto start after reboot

```bash
$ docker update --restart always postgresql 
```

## MongoDB on docker
```bash
$ docker run -d -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=Abc12345 -p 27017:27017 -v $HOME/db/mongodb:/data/db mongo
```

## Redis on docker
```bash
$ docker run -d -p 6379:6379 redis
```

## Redis Sentinel on docker
```bash
$ docker run -d -p 6379:6379 redis
```
```bash
$ docker run -p 26379:26379 -e REDIS_MASTER_HOST=127.0.0.1 bitnami/redis-sentinel
```
```js
await ioRedisStore({
  sentinels: [
    {
      host: 'localhost'
      port: 26379
    },
  ],
  name: 'mymaster',
  ttl: configService.get(REDIS_TTL),
}),
```

## PostgreSQL on docker

```bash
$ docker run -d -e POSTGRES_USER=root -e POSTGRES_PASSWORD=Abc12345 -e PGDATA=/var/lib/postgresql/data/pgdata -p 5432:5432 -v $HOME/db/postgresql:/var/lib/postgresql/data postgres
```

## MySQL on docker
root is default user
```bash
$ docker run -d -e MYSQL_ROOT_PASSWORD=Abc12345 -v $HOME/db/mysql:/var/lib/mysql -p 3306:3306 mysql
```
## RabbitMQ with enabled management ui plugin on docker
http://localhost:8080
```bash
$ docker run -d -e RABBITMQ_DEFAULT_USER=root -e RABBITMQ_DEFAULT_PASS=Abc12345 -p 8080:15672 -p 5672:5672 rabbitmq:3-management
```


## Elasticsearch on docker
http://localhost:9200
```bash
$ docker run -d --name elasticsearch --network elastic -p 9200:9200 -p 9300:9300 -e "xpack.security.enabled=false" -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:8.4.1
```

## Kibana on docker
http://localhost:5601
```bash
$ docker run -d --network elastic -e ELASTICSEARCH_URL=http://elasticsearch:9200 -p 5601:5601 kibana:8.4.2
```

kibana and elasticsearch must be on the same network for connecting!

