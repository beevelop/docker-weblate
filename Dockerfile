FROM beevelop/base

MAINTAINER Maik Hummel <m@ikhummel.com>

WORKDIR /opt/

COPY requirements.txt ./
COPY start ./

RUN apt-get -qq update && \
    apt-get -qq install python-psycopg2 python-lxml python-pillow gcc libxml2-dev python-dev python python-dev python-pip python-virtualenv -y --no-install-recommends && \
    apt-get -qq install curl git mercurial ssh gettext -y && \
    pip install -r requirements.txt && \
    chmod +x start

COPY settings.py /usr/local/lib/python2.7/dist-packages/weblate/

EXPOSE 8000

ENV DJANGO_SETTINGS_MODULE weblate.settings

CMD ./start
