FROM ubuntu:14.04
MAINTAINER justyna.ilczuk@gmail.com

# Update the Ubuntu
RUN apt-get update && apt-get -qqy upgrade

RUN apt-get install -qqy python-pip

RUN useradd app -d /home/app -s /bin/bash

ADD requirements.txt /home/app/requirements.txt

WORKDIR /home/app

RUN pip install -r requirements.txt

USER app

ADD . /home/app

CMD python rethink_auth/manage.py runserver
