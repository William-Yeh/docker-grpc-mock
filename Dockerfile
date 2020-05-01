FROM node:14.1.0-alpine3.10
MAINTAINER William Yeh <william.pjyeh@gmail.com>

ENV NODE_PATH=/usr/local/lib/node_modules

RUN echo "===> Adding compiling tools for npm..."     && \
    apk add --no-cache git python3 make g++ musl-dev  && \
    \
    \
    echo "===> Installing grpc-mock..."           && \
    npm config set unsafe-perm true               && \
    npm install YoshiyukiKato/grpc-mock --global  && \
    \
    \
    echo "===> Removing unused stuff..."    && \
    apk del git python3 make g++ musl-dev   && \
    rm -rf /var/cache/apk/*

EXPOSE 50051
ENTRYPOINT ["node"]
