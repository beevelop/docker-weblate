FROM beevelop/base

MAINTAINER Maik Hummel <m@ikhummel.com>

WORKDIR /opt

ADD requirements.txt .

ADD settings.py .


RUN apt-get -qq update

RUN apt-get -qq install python-psycopg2 python-lxml python-pillow gcc libxml2-dev python-dev python python-dev python-pip python-virtualenv -y --no-install-recommends

RUN apt-get -qq install curl git mercurial ssh gettext -y

RUN pip install -r requirements.txt

RUN ln -s /opt/settings.py /usr/local/lib/python2.7/dist-packages/weblate/settings.py

EXPOSE 8000

ENV DJANGO_SETTINGS_MODULE weblate.settings

CMD django-admin runserver 0.0.0.0:8000
