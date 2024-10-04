#!/bin/bash

cd /ente/web

PORT=3000 NEXT_PUBLIC_ENTE_ENDPOINT=https://photos.dill.moe \
    NEXT_PUBLIC_ENTE_ALBUMS_ENDPOINT=https://albums.dill.moe \
    yarn dev:photos

PORT=3010 NEXT_PUBLIC_ENTE_ENDPOINT=https://photos.dill.moe \
    NEXT_PUBLIC_ENTE_ALBUMS_ENDPOINT=https://albums.dill.moe \
    yarn dev:albums
