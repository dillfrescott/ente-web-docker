FROM ubuntu:24.04 AS builder

RUN apt update && apt upgrade -y

RUN apt install -y git curl sudo

RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh

RUN sudo -E bash nodesource_setup.sh

RUN sudo apt install -y nodejs

RUN npm i -g yarn

RUN git clone https://github.com/ente-io/ente /ente

WORKDIR /ente/web

RUN git submodule update --init --recursive

RUN yarn install && npm run build

FROM ubuntu:24.04 AS main

RUN apt update && apt upgrade -y

RUN apt install -y git curl sudo

RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh

RUN sudo -E bash nodesource_setup.sh

RUN sudo apt install -y nodejs

RUN npm i -g serve

COPY --from=builder /ente/web/apps/photos/out /web

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "-c", "chmod +x /entrypoint.sh && /entrypoint.sh"]