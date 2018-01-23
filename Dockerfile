FROM python:2.7

RUN sed -i "1i\deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib" /etc/apt/sources.list \
    && sed -i "1i\deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib" /etc/apt/sources.list \
    && sed -i "1i\deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib" /etc/apt/sources.list \
    && sed -i "1i\deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib" /etc/apt/sources.list \
    && apt-get update && apt-get install -y git build-essential libatlas-base-dev \
    && mkdir /root/.pip \
    && echo "[global]" >> /root/.pip/pip.conf \
    && echo "index-url = http://mirrors.aliyun.com/pypi/simple/" >> /root/.pip/pip.conf \
    && echo "" >> /root/.pip/pip.conf \
    && echo "[install]" >> /root/.pip/pip.conf \
    && echo "trusted-host=mirrors.aliyun.com" >> /root/.pip/pip.conf \
    && pip install numpy cython pytest ipython==5.5.0

VOLUME /word2vec
WORKDIR /word2vec
