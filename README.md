The Data Kit Project
====================

A good starting point for python experiments with data processing in mind.


**Features:**

- Runs python 3.x
- Runs an unprivileged user that maps to your host user ID
- Runs a jupyter notebook by default
- App container python libs are installed in a virtualenv
- Contains most commonly used python scientific libs
- Links up MySQL and PostgreSQL containers and are also accessible from your host machine
- All database encodings are UTF8


Contributions are welcome!


## Minimum Requirements

- Linux OS
- Docker
- Docker Compose


**Tested on:**

- Ubuntu 16.04
- Docker 17.06.2-ce
- Docker Compose 1.15.0


## Usage

#### 1)

Start the docker services

```
$ find . -iname "*.sh" | xargs chmod +x
$ docker-compose -p tdk run -d --service-ports --name tdk_app app
```

Then open your browser to: http://0.0.0.0:8888

Default password is `changeme`


All configuration defaults can be found in `var/etc/`


#### 2)

Execute shell commands in the app container

```
$ docker exec -it tdk_app bash
```

#### 3)

Add additional python libs on a running app container

```
$ docker exec -it tdk_app bash

caffeine@9a346c93b8d9:~/project$ . ~/venv/bin/activate
(venv) caffeine@9a346c93b8d9:~/project$ pip install [some-python-lib]
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
