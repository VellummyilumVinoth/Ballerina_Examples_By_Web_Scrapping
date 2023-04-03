// This is the service definition for the server streaming scenario.
syntax = "proto3";

import "google/protobuf/wrappers.proto";

service HelloWorld {
	rpc lotsOfReplies (google.protobuf.StringValue) returns (stream google.protobuf.StringValue);
}

import ballerina/grpc;
import ballerina/io;

public function main() returns error? {
    // Creates a gRPC client to interact with the remote server.
    HelloWorldClient ep = check new ("http://localhost:9090");

    // Executes the streaming RPC call and gets the response as a stream.
    stream<string, grpc:Error?> result = check ep->lotsOfReplies("WSO2");
    // Iterates through the stream and prints the content.
    check result.forEach(function(string str) {
        io:println(str);
    });
}
