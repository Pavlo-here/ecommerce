FROM python:3.10.12


SHELL ["/bin/bash", "-c"]

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN apt-get update
# RUN apt-get update && apt-get -qy install gcc libjpeg-dev libxslt-dev \
#     libpq-dev libmariadb-dev libmariadb-dev-compat gettext cron openssh-client flake8 locales vim

RUN useradd -rms /bin/bash pavlo && chmod 777 /opt /run

WORKDIR /ecommerce
EXPOSE 8000

RUN mkdir /ecommerce/static && mkdir /ecommerce/static/images && chown -R pavlo:pavlo /ecommerce && chmod 755 /ecommerce

COPY --chown=pavlo:pavlo . .

RUN pip install -r requirements.txt

USER pavlo

# CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000" ]