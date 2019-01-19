# Docker Compose Demo

[Docker Compose](https://docs.docker.com/compose/) allows users to orchestrate multiple [Docker](https://www.docker.com/) containers that can talk to one another.

This repository contains a `docker-compose.yml` file starting the following containers:

- `db` - a [PostgreSQL](https://www.postgresql.org/) database housing data
- `api` -  a mock prediction API (built using [responder](https://python-responder.org/en/latest/)). In a real world setting this could for instance run an into data point through a previously trained machine learning model and return a prediction.
- `dash` - a simple [Dash](https://dash.plot.ly/) dashboard that reads data from `db` and runs them to the prediction `api`.
- `jnb`- a [Jupyter lab](https://jupyterlab.readthedocs.io/en/stable/) environment to run Jupyter notebooks beind able to read/write data from `db`, run data through the `api` and so on.

## Usage

To run Docker Compose:

```
docker-compose up --build
```

Shutdown and remove containers:

```
docker-compose down
```

## TODO:

- README:
   - describe components in more detail
- how do volumes relate to containers? what about persistance?
- add more container components?
- show how to use a simple, pretrained tf model from tf hub in API?

