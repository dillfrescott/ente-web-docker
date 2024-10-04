FROM ubuntu:24.04 AS builder

ENV NEXT_PUBLIC_ENTE_ACCOUNTS_URL=https://accounts.dill.moe

ENV NEXT_PUBLIC_ENTE_FAMILY_URL=https://families.dill.moe

ENV NEXT_PUBLIC_ENTE_ENDPOINT=https://photos.dill.moe

ENV NEXT_PUBLIC_ENTE_ALBUMS_ENDPOINT=https://albums.dill.moe

RUN apt update && apt upgrade -y

RUN apt install -y git curl sudo

RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh

RUN sudo -E bash nodesource_setup.sh

RUN sudo apt install -y nodejs

RUN npm i -g yarn

RUN git clone https://github.com/ente-io/ente /ente

WORKDIR /ente/web

RUN git submodule update --init --recursive

RUN yarn install && npm run build && npm run build:accounts

FROM ubuntu:24.04 AS main

RUN apt update && apt upgrade -y

RUN apt install -y curl

RUN curl https://getcroc.schollz.com | bash

COPY --from=builder /ente/web/apps/photos/out /web

COPY --from=builder /ente/web/apps/accounts/out /accounts

RUN tar -czvf /web.tgz /web

RUN tar -czvf /accounts.tgz /accounts

ENTRYPOINT ["/bin/bash", "-c", "croc send /web.tgz /accounts.tgz"]