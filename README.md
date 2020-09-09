# Mock GRPC Server

![Docker Image CI](https://github.com/William-Yeh/docker-grpc-mock/workflows/Docker%20Image%20CI/badge.svg)

This repository can be used to build a docker image that leverages `grpc-mock` (`https://github.com/YoshiyukiKato/grpc-mock`) to provide a *mock* gRPC server that can be utilized for testing.


# Usage

To utilize this image `protobuf` file(s) must be supplied as well as
a `node.js` file to create the server. There is an example in the
`example` directory.

## Example Mock Server

To run the example you can use the following docker command:

```bash
docker run -tid \
  --name mock --rm -p 50051:50051 \
  -v $(pwd)/example:/proto \
  williamyeh/grpc-mock /proto/mock.js
```

## Example Client

The utility `grpcurl` can be used to test the mock server using the
following command:

```bash
grpcurl -proto example/greeter.proto \
  -plaintext \
  -d '{"message": "Hello"}' \
  localhost:50051 greeter.Greeter/Hello
```

## Other Examples

In the `example` directory there is input samples for the streaming requests to use these files
you can issue commands similar to the following (substituting the appropriate input file and
method name):

```bash
cat example/chat-1.json | grpcurl -proto example/greeter.proto \
  -plaintext -d @ localhost:50051 greeter.Greeter/Chat
```

## Useful Environment Variables

To enable debugging information when running the mock server the following
environment variables can be set when starting the mock server container:

```bash
GRPC_VERBOSITY=DEBUG
GRPC_TRACE=all
```

## Credit

This repo was originally forked from [`ciena/docker-grpc-mock`](https://github.com/ciena/docker-grpc-mock) on May 2020, which was based on `node:8.16-alpine`.