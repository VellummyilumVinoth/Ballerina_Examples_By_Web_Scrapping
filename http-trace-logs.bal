import ballerina/http;

type Album readonly & record {|
    string title;
    string artist;
|};

service /info on new http:Listener(9095) {

    resource function get albums(http:Request req) returns Album[]|error {
        http:Client albumEP = check new ("localhost:9090");
        Album[] albums = check albumEP->forward("/albums", req);
        return albums;
    }
}

[ballerina.http.traceLogAdvancedConfig]
# Enable printing trace logs on the Console. The default value is `false`.
console = true
# Specify the file path to save the trace logs. This is optional.
path = "testTraceLog.txt"
# Specify the hostname and port of a socket service to publish the trace logs. These are optional.
host = "localhost"
port = 8080 
