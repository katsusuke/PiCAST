FROM alpine:edge

RUN apk update
RUN apk add nodejs nodejs-npm youtube-dl lame mpg123 mplayer git g++ gcc make x264 ffmpeg
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add livestreamer@testing
RUN mkdir /picast
WORKDIR /picast

COPY picast.js .
COPY package.json .
COPY package-lock.json .
RUN npm install

CMD node picast.js



