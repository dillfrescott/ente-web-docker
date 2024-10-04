#!/bin/bash

NEXT_PUBLIC_ENTE_ENDPOINT=https://photos.dill.moe \
    NEXT_PUBLIC_ENTE_ALBUMS_ENDPOINT=https://photos-web.dill.moe \
    serve /ente/web/apps/photos/out --port 3000 &