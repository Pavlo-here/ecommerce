FROM python:3.9-alpine

ENV PYTHONUNBUFFERED 1


COPY ./ecommerce /ecommerce
COPY ./requirements.txt /requirements.txt
# COPY ./scripts /scripts

WORKDIR /ecommerce
EXPOSE 8000


RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev linux-headers && \
    /py/bin/pip install -r /requirements.txt && \
    apk del .tmp-deps && \
    adduser --disabled-password --no-create-home ecommerce && \
    su ecommerce && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/media && \
    #chown -R ecommerce:ecommerce vol && \
    find /vol -type d -exec chmod 755 {} + && \
    chmod -R +x /scripts

ENV PATH="/py/bin:$PATH"

USER ecommerce

# CMD ["run.sh"]