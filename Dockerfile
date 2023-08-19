FROM python:3.9.17-alpine3.18

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./ecommerce /ecommerce

WORKDIR /ecommerce
EXPOSE 8000

RUN pyhton -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -p requirements.txt && \
    adduser --disabled-password --no-create-home ecommerce

ENV PATH="/py/bin:$PATH"

USER ecommerce


