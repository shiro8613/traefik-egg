FROM ubuntu as build

RUN mkdir /srv/traefik-build
WORKDIR /srv/traefik-build

RUN apt-get update
RUN apt-get install -y wget

RUN wget https://github.com/traefik/traefik/releases/download/v2.7.0-rc2/traefik_v2.7.0-rc2_linux_amd64.tar.gz && \
  tar -zxvf traefik_v2.7.0-rc2_linux_amd64.tar.gz

FROM ubuntu

MAINTAINER toms0910, <tomservs>

RUN mkdir /usr/local/traefik
COPY --from=build /srv/traefik-build/traefik /usr/local/traefik/traefik

RUN useradd -d /home/container -m container
RUN chown -R container:container /usr/local/traefik

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]