# Creates vanilla hubot install 
#
# Author: Paul Czarkowski
# Date: 07/12/2013
# Based on :- https://github.com/rogaha/docker-desktop


FROM base
MAINTAINER Paul Czarkowski "paul@paulcz.net"

RUN apt-get update

RUN apt-get -y install nodejs npm redis-server

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g hubot coffee-script

RUN hubot --create .

RUN chmod 755 bin/hubot 

ADD hubot-scripts.json hubot-scripts.json

RUN bin/hubot -h

# Start hubot
CMD ["bin/hubot"]

