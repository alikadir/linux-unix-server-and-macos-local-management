[<< Back](README.md)

# Docker

for install docker on Ubuntu visit [link](https://docs.docker.com/engine/install/ubuntu/) 

#### Get all containers

```Bash
$ docker ps -a
```

#### Remove container

```Bash
$ docker remove postgresql
```

#### Rename container

```Bash
$ docker rename old_name new_name
```

#### Start, stop and restart container

```Bash
$ docker start postgresql
```

```Bash
$ docker stop postgresql
```

```Bash
$ docker restart postgresql
```

#### Show container logs

```Bash
$ docker logs postgresql
```

## Docker container auto start after reboot

```Bash
$ docker update --restart always postgresql 
```

## PostgreSQL on docker

```Bash
$ docker run -d --name postgresql -e POSTGRES_PASSWORD=123-Ali-456 -e PGDATA=/var/lib/postgresql/data/pgdata -p 5432:5432 -v $HOME/db/postgresql:/var/lib/postgresql/data postgres
```

## Elasticsearch on docker

```Bash
$ docker run -d --name elasticsearch --network elastic -p 9200:9200 -p 9300:9300 -e "xpack.security.enabled=false" -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:8.4.1
```

## Kibana on docker

```Bash
$ docker run -d --network elastic -e ELASTICSEARCH_URL=http://elasticsearch:9200 -p 5601:5601 kibana:8.4.2
```

kibana and elasticsearch must be on the same network for connecting!

