# -*- coding: utf-8 -*-
import dash
import dash_core_components as dcc
import dash_html_components as html
import logging
import pandas as pd
import requests
import time
from sqlalchemy import create_engine
from sqlalchemy.exc import OperationalError

logging.basicConfig(level=logging.INFO)

engine = create_engine('postgresql://guest@localhost:8001/shared')
num_tries = 3
current_tries = 0
df = None
while True:
    logging.info(f"Trying to connect to psql DB. Try {current_tries}.")
    try:
        df = pd.read_sql_query('select * from data', con=engine)
        break
    except OperationalError as err:
        current_tries += 1
        if current_tries <= num_tries:
            time.sleep(10)
        else:
            raise err

predictions = []
for val in df['score']:
    r = requests.get(f'http://127.0.0.1:4000/predict/{val}')
    predictions.append(float(r.text))
df['prediction'] = predictions

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

app.layout = html.Div(children=[
    html.H1(children='Hello Dash'),

    html.Div(children='''
        Dash: A web application framework for Python.
    '''),

    dcc.Graph(
        id='example-graph',
        figure={
            'data': [
                {'x': df['id'], 'y': df['score'], 'type': 'bar', 'name': 'Input'},
                {'x': df['id'], 'y': df['prediction'], 'type': 'bar', 'name': 'Prediction'},
            ],
            'layout': {
                'title': 'Dash Data Visualization'
            }
        }
    )
])

if __name__ == '__main__':
    app.run_server(debug=True)

