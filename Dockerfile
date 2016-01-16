FROM ubuntu:14.04
MAINTAINER Steve Mayne <steve.mayne@gmail.com>

RUN apt-get update && apt-get install -q -y \
  default-jre

ENV FILE_STORE /tmp/s3proxy
ENV S3PROXY_CONFIG /etc/s3proxy.conf
ENV ACCESS_KEY ""
ENV SECRET_KEY ""

RUN mkdir /opt/s3proxy
ENV PATH /opt/s3proxy:$PATH

RUN mkdir /tmp/s3proxy
VOLUME /tmp/s3proxy/

ADD s3proxy.conf /etc/s3proxy.conf.base
ADD docker-entrypoint.sh /docker-entrypoint.sh

ADD https://github.com/andrewgaul/s3proxy/releases/download/s3proxy-1.4.0/s3proxy /opt/s3proxy/s3proxy

RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /opt/s3proxy/s3proxy

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["s3proxy"]
