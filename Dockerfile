FROM ubuntu:23.04

ENV NODE_HOME=/u01/middleware/node-v18.14.1-linux-x64
ENV PATH=$PATH:$NODE_HOME/bin

RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware

ADD https://nodejs.org/dist/v18.14.1/node-v18.14.1-linux-x64.tar.xz .
RUN apt update -y
RUN apt install -y xz-utils
RUN tar -xvf node-v18.14.1-linux-x64.tar.xz
RUN rm -f node-v18.14.1-linux-x64.tar.xz

RUN mkdir -p /u01/app
WORKDIR /u01/app
COPY . /app
RUN npm install
CMD ["npm","start"]


