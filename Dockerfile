FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i en_US en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TZ JST-9
ENV TERM xterm

# change to Japan time
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime


RUN apt-get install -y vim less
RUN pip install --upgrade pip\
                --upgrade setuptools

COPY ./requirements.txt requirements.txt 
RUN pip install -r requirements.txt # 追加

RUN python -m pip install --upgrade pip
RUN apt-get install -y mecab mecab-ipadic-utf8 libmecab-dev swig
RUN python -m pip install mecab-python3
RUN python -m pip install spacy
