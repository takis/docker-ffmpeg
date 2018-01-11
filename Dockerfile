FROM alpine:latest AS build-env
MAINTAINER Takis Issaris <takis@issaris.com>
RUN apk add --no-cache build-base coreutils gcc git make yasm
WORKDIR /app
RUN git clone https://github.com/FFmpeg/FFmpeg ffmpeg
WORKDIR /app/ffmpeg
RUN ./configure && make -j 8 && make install

FROM alpine:latest
COPY --from=build-env /usr/local/bin/ffmpeg /usr/local/bin/ffmpeg
