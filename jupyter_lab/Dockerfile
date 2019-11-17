FROM jupyter/all-spark-notebook:814ef10d64fb

USER root

RUN wget -q https://github.com/iterative/dvc/releases/download/0.68.1/dvc_0.68.1_amd64.deb && \ 
    apt-get install -y ./dvc_0.68.1_amd64.deb