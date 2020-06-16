FROM python:3.7-alpine
#FROM python:3.9-rc-alpine3.12
# https://hub.docker.com/_/python
MAINTAINER Mariusz Byczynski

ENV PYTHONUNBUFFERED 1

# copy of local req to docker image
COPY ./requirements.txt /requirements.txt
# pip will install all software named in requirements file 
RUN pip install -r /requirements.txt

# create empty folder on docker image named app 
RUN mkdir /app
# set workdir, from taht point any application will be started from that dir
WORKDIR /app
# copy any app from host to docker image
COPY ./app /app


# create user only for process of custom installation
# it is not recomended to run docker with root user
RUN adduser -D user
USER user
# is docker can resolve DNS names
RUN nslookup google.com