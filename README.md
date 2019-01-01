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

To run Docker Compose:

```
docker-compose up
```

TODO:

- fill postgres DB with persistent data
  - create/change superuser and pw
  - create read-only guest user
  - https://docs.docker.com/compose/environment-variables/#the-env-file
  - https://hub.docker.com/_/postgres/
- test DB from jnb
- add dash thingy that reads data from DB, runs through API and shows to user
