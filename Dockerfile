FROM debian:buster

# TODO: multi-stage build. Final image should just
# contain p9p, not gcc too.

RUN apt-get update \
    && apt-get install -y gcc \
    && rm -rf /var/lib/apt/lists/*

ARG SRC=/usr/src/plan9port
COPY 9port/ $SRC
WORKDIR $SRC
RUN ./INSTALL

ENV PLAN9 $SRC
ENV PATH $PATH:$PLAN9/bin
