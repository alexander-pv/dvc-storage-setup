FROM python:3.10.10-slim

ARG PORT=8082

WORKDIR /webdav
RUN mkdir -p ./webdav_storage/dvc
COPY requirements.txt .
COPY wsgidav.yaml .
RUN pip install -r requirements.txt

EXPOSE $PORT

CMD wsgidav -c ./wsgidav.yaml