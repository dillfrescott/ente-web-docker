#!/bin/bash

cd /ente/web

NEXT_PUBLIC_ENTE_ENDPOINT=https://photos.dill.moe \
    NEXT_PUBLIC_ENTE_ALBUMS_ENDPOINT=https://albums.dill.moe \
    yarn dev:photos &

NEXT_PUBLIC_ENTE_ENDPOINT=https://photos.dill.moe \
    NEXT_PUBLIC_ENTE_ALBUMS_ENDPOINT=https://albums.dill.moe \
    yarn dev:albums