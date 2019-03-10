# Docker Compose Demo

[Docker Compose](https://docs.docker.com/compose/) allows users to orchestrate multiple [Docker](https://www.docker.com/) containers that can talk to one another.

This repository contains a `docker-compose.yml` file starting the following containers:

- `postgres` - a [PostgreSQL](https://www.postgresql.org/) database housing a toy dataset
- `api` -  a mock prediction API (built as a [responder](https://python-responder.org/en/latest/) app). In a real world setting this API could, for instance, run an input data point through a previously trained machine learning model and return a prediction.
- `dash` - a simple [Dash](https://dash.plot.ly/) dashboard that reads data from `postgres` and runs them trough the prediction `api`.
- `jnb`- a [Jupyter lab](https://jupyterlab.readthedocs.io/en/stable/) environment to run Jupyter notebooks being able to read/write data from `postgres`, run data through the `api` and so on.

## Usage

To run Docker Compose:

```
docker-compose up --build
```

The Jupyter lab server is available at: http://127.0.0.1:10000/lab

The dashboard is then available at: http://127.0.0.1:8050/

Airflow is available at: http://127.0.0.1:8080

Shutdown and remove containers:

```
docker-compose down
```

## To clean up unused containers, images, networks

```
docker system prune
```

Adding `--volumes` also removes volumes.

## TODO?

- spark
 using https://jupyter-docker-stacks.readthedocs.io/en/latest/using/specifics.html#apache-spark?
- kafka
- airflow job to retrain models
- fancier dashboard?
- how do volumes relate to containers? what about persistance?
- add more container components?
- show how to use a simple, pretrained tf model from tf hub in API?

