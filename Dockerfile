FROM ubuntu
CMD /bin/bash
MAINTAINER Osman Omer, github/docker short name: oaomer
RUN apt-get update
RUN mkdir -p /tmp/osman/docker/debug
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y npm
RUN mkdir -p /usr/src/node-red
RUN mkdir /usr/src/node-red/log
WORKDIR /usr/src/node-red
RUN groupadd --force node-red
RUN useradd --home /usr/src/node-red --gid node-red node-red
RUN chown -R node-red:node-red /usr/src/node-red
USER node-red
RUN mkdir -p /usr/src/node-red/.node-red
RUN npm install node-red
EXPOSE 1880/tcp
COPY package.json /usr/src/node-red/package.json
COPY flow-file.json /usr/src/node-red/.node-red/node-red
CMD npm start node-red
