FROM python:3.9-slim

COPY requirements.txt docker-entrypoint.sh ./

RUN pip install -U pip \
    && pip install -r requirements.txt \
    && mkdir -p /data

WORKDIR /github/workspace

ENTRYPOINT [ "/docker-entrypoint.sh" ]
