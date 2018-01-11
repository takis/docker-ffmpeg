FROM debian:stretch-slim AS build-env
MAINTAINER Takis Issaris <takis@issaris.com>
RUN apt-get update && apt-get install -y gcc git make yasm && apt-get clean
WORKDIR /app
RUN git clone https://github.com/FFmpeg/FFmpeg ffmpeg
WORKDIR /app/ffmpeg
RUN ./configure && make && make install

FROM debian:stretch-slim
COPY --from=build-env /usr/local/bin/ffmpeg /usr/local/bin/ffmpeg
