FROM alpine
MAINTAINER sogeuni@gmail.com

RUN apk add --update tzdata ffmpeg coreutils && rm -rf /var/cache/apk/*

ENV STREAM_URL "rtmp://ebsandroid.ebs.co.kr/fmradiofamilypc/familypc1m"

# set timezone (Asia/Seoul)
RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime

ADD record.sh /record.sh
ADD entry.sh /entry.sh
ADD schedule.txt /schedule.txt
VOLUME ["/outputs"]

RUN chmod 755 /record.sh /entry.sh
RUN /usr/bin/crontab /schedule.txt

CMD ["/entry.sh"]
