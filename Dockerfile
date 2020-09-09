FROM node:14 AS builder
LABEL maintainer="william.pjyeh@gmail.com" name="William Yeh"

ADD . /app
WORKDIR /app

RUN echo "===> Installing grpc-mock..."
RUN npm config set unsafe-perm true
RUN npm install YoshiyukiKato/grpc-mock

#
#-------------------------------
#

FROM gcr.io/distroless/nodejs:14
#FROM gcr.io/distroless/nodejs:14-debug
#FROM node:14
LABEL maintainer="william.pjyeh@gmail.com" name="William Yeh"

COPY --from=builder /app/node_modules /app/node_modules
ENV NODE_PATH=/app/node_modules

EXPOSE 50051
#ENTRYPOINT ["node"]
