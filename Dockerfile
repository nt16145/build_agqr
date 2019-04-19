# ubuntuのイメージを取得
FROM ubuntu:latest

#Dockerfile作成者
MAINTAINER linaction

# d4b7dddeadc8b656187353378aef2d980e23a824

WORKDIR /

RUN mkdir radio

RUN apt update && apt -y upgrade 
#タイムゾーンの設定
RUN apt-get install -y tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt install -y python python-pip cron rtmpdump ffmpeg git ruby
# RUN git https://github.com/nt16145/agqr

RUN pip install PyDrive

RUN service cron start

RUN echo '29,59 * * * *  cd /radio/;ruby agqr.rb;python upload.py' >> /etc/crontab

ADD /radio /radio/
