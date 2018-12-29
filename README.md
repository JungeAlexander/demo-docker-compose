Docker for data science workflows

```
docker run --rm -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyter/scipy-notebook:7254cdcfa22b
```

Start responder add:

```
cd responder_app/
pipenv shell
python app.py
```

Open e.g. http://127.0.0.1:5042/predict/3 in browser.
