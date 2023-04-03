import ballerina/http;
import ballerina/io;
import ballerina/mime;

type Album readonly & record {
    string title;
    string artist;
};

public function main() returns error? {
    http:Client albumClient = check new ("localhost:9090");

    Album[] albums = check albumClient->/albums({
        Accept: mime:APPLICATION_JSON
    });
    io:println("Received albums: " + albums.toJsonString());
}

// Sends a `POST` request to the "/album" resource.
// The query parameter can be provided as parameters in the `post` method invocation.
string albumId = check albumClient->/album.post({
        title: "Blue Train",
        artist: "John Coltrane"
    },
    // Headers can be specified as a `map<string|string[]>`
    {
        Accept: mime:APPLICATION_JSON
    }
);
io:println("Added album with id: " + albumId);
