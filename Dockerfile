FROM ubuntu:latest
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget xz-utils

# FFMPEG
RUN wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz
RUN mkdir ffmpeg && tar -xvf ffmpeg-git-amd64-static.tar.xz -C ffmpeg

ADD ./video.mov /root/video.mov

RUN mv /ffmpeg/*/ffmpeg /usr/local/bin && mv /ffmpeg/*/ffprobe /usr/local/bin

CMD ["ffprobe", "/root/video.mov"]