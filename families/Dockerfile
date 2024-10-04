FROM ubuntu:24.04

ENV NEXT_WEB_ENTE_ENDPOINT=https://photos-web.dill.moe

ENV NEXT_PUBLIC_ENTE_ENDPOINT=https://photos.dill.moe

RUN apt update && apt upgrade -y

RUN apt install -y git curl sudo

RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh

RUN sudo -E bash nodesource_setup.sh

RUN sudo apt install -y nodejs

RUN npm i -g yarn

RUN git clone https://github.com/ente-io/families /families

WORKDIR /families

RUN npm i --force

RUN npm run build

ENTRYPOINT ["/bin/bash", "-c", "npm run start"]