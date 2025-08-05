[<< Back](README.md)

# Docker and Multipass

## Multipass

[Multipass](https://multipass.run) is a quick and easy way to launch virtual machine instances running Ubuntu on MacOS or Windows or Linux

### Install Multipass
```bash
$ brew install --cask multipass
```
### Create new instances
```bash
$ multipass launch 

Launching dancing-chipmunk...
Downloading Ubuntu 18.04 LTS..........
Launched: dancing chipmunk
```
### Show running instance
```bash
$ multipass list

Name                    State             IPv4             Release
dancing-chipmunk        RUNNING           10.125.174.247   Ubuntu 18.04 LTS
live-naiad              RUNNING           10.125.174.243   Ubuntu 18.04 LTS
snapcraft-asciinema     STOPPED           --               Ubuntu Snapcraft builder for Core 18
```

### Show detail of the instance
```bash
$ multipass info dancing-chipmunk

Name:           dancing-chipmunk
State:          RUNNING
IPv4:           10.125.174.247
Release:        Ubuntu 18.04.1 LTS
Image hash:     19e9853d8267 (Ubuntu 18.04 LTS)
CPU(s):         1
Load:           0.97 0.30 0.10
Disk usage:     1.1G out of 4.7G
Memory usage:   85.1M out of 985.4M
```

### Connect to a running instance
```bash
$ multipass shell dancing-chipmunk

Welcome to Ubuntu 18.04.1 LTS (GNU/Linux 4.15.0-42-generic x86_64)

...
```

### Stop and Delete the instance
```bash
$ multipass stop dancing-chipmunk
$ multipass delete dancing-chipmunk
```

### Mount folder to the instance

when launch an instance
```bash
$ multipass launch --mount /some/local/path:/some/instance/path
```
or 
after launch the instance
```bash
$ multipass mount /Users/alikadir/Desktop/PROJECTS/account-api dancing-chipmunk:/var/my-project
```

!!! on MacOS, you can access full disk read to multipassd process at Privacy&Security. 
```AppleIcon > System Settings > Privacy & Security > Full Disk Access > Allow multipassd```


### UnMount folder
```bash
$ multipass umount dancing-chipmunk:/var/my-project
```

### Show IP of the instance 
```bash
$ apt-get update
$ apt-get install net-tools
$ ifconfig
```


------

## Docker

### Install Docker at all Linux Distributions 
```
$ sudo apt update
$ sudo apt upgrade
```
```
$ curl -sSL https://get.docker.com | sh
```
```
$ sudo usermod -aG docker $USER
```
```
$ logout
```
```
$ groups
```
```
$ docker run hello-world
```

### Troubleshooting 
```
$ docker run hello-world
docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?

Run 'docker run --help' for more information
```
reboot Linux and check docker service status
```
$ sudo reboot
---
$ sudo systemctl status docker
```


### Get all containers

```bash
$ docker ps -a
```

### Get container info 

```bash
$ docker inspect <CONTAINER_ID>
```

-n = line numbers
```bash
$ docker inspect 62862d1effe1 | grep 'Mount' -n
31:        "MountLabel": "",
145:        "Mounts": [
```
### Connect to container

-i = interactive

-t = Allocate a pseudo-TTY (?)

```bash
$ docker exec -it <CONTAINER_ID> /bin/bash
```
if require ```sudo``` command use ```root``` user

```bash
docker exec -u root -it <CONTAINER_ID> /bin/bash
```

### Remove container

```bash
$ docker remove postgresql
```

### Rename container

```bash
$ docker rename old_name new_name
```

### Start, stop, and restart the container

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
## Docker Network
### Create Network
```bash
$ docker network create my-network
```
### Run container on the network
```bash
$ docker run -d --name my-redis --network my-network -p 6379:6379 redis
$ docker run -d --name my-app --newtork my-network -p 3000:3000 -e REDIS_CONNECTION="my-redis:6379" 9ef073ac035f9
```
### Connect the container on the Host OS
```bash
$ nc localhost:6379 -v
localhost [127.0.0.1] 6379 open
```

## Docker image

### Docker image build with docker file 

```bash
$ docker build --tag devops-sample-api-project .
```

### Show docker images

```bash
$ docker images --all
```

### Add tag to docker image

```bash
$ docker tag devops-sample-api-project alikadir/devops-sample-api-project:v1.0.0
```

## Push docker image to docker hub

```bash
$ docker login --username USER --password PASSWORD

$ docker push alikadir/devops-sample-api-project --all-tags
```

## Move docker image to another server

### on the Server
[show docker images](docker-and-multipass.md#show-docker-images)

-o = output
```bash
$ docker save -o ~/Desktop/my-container.tar <IMAGE_ID>
```
send another server with [scp](file-transfer.md)
```bash
$ scp scp -rp ~/Desktop/my-container.tar root@111.111.111.111:/var/www/alikadir.com/
```
### on Another Server (111.111.111.111)
-i = import
```bash
$ docker load -i /var/www/alikadir.com/my-container.tar
```
```bash
$ docker images --all
```


# Dockers
-d = detach container

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

## SqlServer on docker
sa is default user
```bash
$ docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Abc12345" -v $HOME/db/mssql:/var/opt/mssql/data  -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest
```
connection testing CLI
```bash
$ npm install -g mssql
$ echo "SELECT name FROM master.dbo.sysdatabases" | mssql mssql.conn.json
$ cat mssql.conn.json
{
    "user": "sa",
    "password": "Abc12345",
    "server": "localhost",
    "database": "master"
}
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

## Jenkins on docker
http://localhost:8080

initial password at ```/var/jenkins_home/secrets/initialAdminPassword```
```
$ docker run -d -p 8080:8080 -v $HOME/jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

### Jenkins (docker in docker)
jenkins run in docker and each job run in docker 

--privileged = not force use sudo (already not use sudo in docker) 
1) Create Dockerfile with install and ser permission for docker in jenkins  
```
$ tee Dockerfile << EOF
  FROM jenkins/jenkins:lts-jdk17
  USER root
  RUN apt update && curl -fsSL https://get.docker.com | sh
  RUN usermod -aG docker jenkins
  USER jenkins
EOF
```
2) Build Dockerfile
```
$ docker build . -t my_jenkins_with_docker
```
3) Run DockerImage
```
$ docker run -d -it --restart=always -p 8080:8080 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock my_jenkins_with_docker
```
4) Jenkinsfile using
```
pipeline {
    agent {
      docker { 
        image 'mcr.microsoft.com/dotnet/sdk:6.0' 
        args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
      }
    }
    stages {
```

## Sonarqube
default user and password are **admin**
```
$ docker run -d -p 9000:9000 sonarqube
```
```bash
$ docker run -d -v $HOME/sonarqube/data:/opt/sonarqube/data -v $HOME/sonarqube/logs:/opt/sonarqube/logs -v $HOME/sonarqube/extensions:/opt/sonarqube/extensions  -p 9000:9000 sonarqube
```
