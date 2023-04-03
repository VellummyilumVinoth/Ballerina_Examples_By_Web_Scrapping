syntax = "proto3";

import "google/protobuf/wrappers.proto";

service HelloWorld {
    rpc hello (google.protobuf.StringValue) returns (google.protobuf.StringValue);
}

import ballerina/grpc;

@grpc:Descriptor {
    value: GRPC_SERVICE_SIMPLE_DESC
}
service "HelloWorld" on new grpc:Listener(9090) {

    remote function hello(string request) returns string {
        // Reads the request message and sends a response.
        return "Hello " + request;
    }
}
