FROM python:3.7
 
COPY requirements.txt /
RUN pip install -r /requirements.txt
 
RUN mkdir /app
WORKDIR /app
COPY ./ ./
 
EXPOSE 8050
CMD ["python", "./app.py"]