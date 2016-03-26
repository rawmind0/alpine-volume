FROM rawmind/alpine-base:0.3.3-3
MAINTAINER Raul Sanchez <rawmind@gmail.com>

ADD root /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
