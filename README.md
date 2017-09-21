The Data Kit Project
====================

A good starting point for python experiments with data processing in mind.


## Minimum Requirements

- Ubuntu 16.04
- Docker
- Docker Compose


## Usage

#### 1)

Start the docker services

```
find . -iname "*.sh" | xargs chmod +x
docker-compose -p tdk run -d --service-ports --name tdk_app app
```

The open your browser to: http://0.0.0.0:8888

Default password is `changeme`


All configuration defaults can be found in `var/etc/`


#### 2)

Destroy created containers

```
docker rm tdk_app tdk_pgsql tdk_mysql
```


#### 3)

Execute shell commands in the app container

```
docker exec -it tdk_app bash
```


## Troubleshooting

#### Failed to map the correct User ID

The docker-compose file assumes that your user ID is `1000`. Change it to
the correct one otherwise.

You may run:

```
$ id -u
```

To find the correct user ID.
