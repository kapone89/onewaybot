FROM    node:6

RUN     apt-get update && apt-get install -y apt-transport-https
RUN     curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN     apt-get update && apt-get install -y yarn

RUN     mkdir -p /app
RUN     mkdir -p /data/app
VOLUME  /app
VOLUME  /data/app

RUN     git clone https://github.com/ivkos/botyo.git /app

WORKDIR /app
RUN     yarn install
RUN     yarn run build

CMD     ["node", "build/index.js"]
