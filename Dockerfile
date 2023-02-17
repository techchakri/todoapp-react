FROM ubuntu:23.04

ENV NODE_HOME=/u01/middleware/node-v18.14.1
ENV PATH=$PATH:$NODE_HOME/bin

RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware

ADD https://nodejs.org/dist/v18.14.1/node-v18.14.1-linux-x64.tar.xz .
RUN sudo apt update -y
RUN sudo apt install -y utils-xz
RUN tar -xzvf node-v18.14.1-linux-x64.tar.xz
RUN rm -f node-v18.14.1-linux-x64.tar.xz

RUN npm install
CMD ["npm","start"]


