# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf

## Add source code to the build stage.
ADD . /bibtool
WORKDIR /bibtool

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN ./configure
RUN make

#Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /bibtool/bibtool /
