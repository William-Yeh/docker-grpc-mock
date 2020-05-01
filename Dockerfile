FROM node:14.1.0-alpine3.10
MAINTAINER Ciena Corporation

RUN apk add --update git
ENV NODE_PATH=/usr/local/lib/node_modules
RUN npm config set unsafe-perm true
RUN npm install YoshiyukiKato/grpc-mock --global
EXPOSE 50051

ENTRYPOINT ["node"]
