Docker for data science workflows

```
docker run --rm -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyter/scipy-notebook:7254cdcfa22b
```

Start responder app:

```
cd responder_app/
pipenv shell
python app.py
```

Open e.g. http://127.0.0.1:5042/predict/1.1 in browser.

Build a Docker image containing the app and start a container:

```
docker build -t responderpredict .
docker run --rm -p 4000:80 responderpredict
```

Open e.g. http://127.0.0.1:4000/predict/1.1 in browser.

Start dash app:

```
cd dashboard
python app.py
```

Open e.g. http://127.0.0.1:5042/predict/1.1 in browser.

Build a Docker image containing the app and start a container:

```
docker build -t mydash .
docker run --rm -p 8002:8050 mydash
```

Open e.g. http://127.0.0.1:8002/ in browser.

To run Docker Compose:

```
docker-compose up --build
```

To get rid of unused volumes:

```
docker volume prune
```

To open Jupyter lab inside Compose:

```
http://127.0.0.1:10000
```

To open dashboard inside Compose:

```
127.0.0.1:8002
```

TODO:

- dash
  - test in compose
- psql questions
  - create/change superuser and pw
  - create read-only guest user
  - https://docs.docker.com/compose/environment-variables/#the-env-file
  - https://hub.docker.com/_/postgres/
  - check if data are persistent between up/downs
  - how to volumes relate to container memory?
  - write to DB using jupyter nb and see if data persistent across runs
- check what else was presented in beyond jnb talk
