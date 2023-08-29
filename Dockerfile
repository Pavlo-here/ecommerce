FROM python:3.9-alpine

ENV PYTHONUNBUFFERED 1


COPY ./ecommerce /ecommerce
COPY ./requirements.txt /requirements.txt
# COPY ./scripts /scripts

WORKDIR /ecommerce
EXPOSE 8000

RUN pyhton -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -p requirements.txt && \
    adduser --disabled-password --no-create-home ecommerce

ENV PATH="/py/bin:$PATH"

USER ecommerce

