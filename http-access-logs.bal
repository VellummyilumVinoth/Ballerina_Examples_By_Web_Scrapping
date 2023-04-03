import ballerina/http;

type Album readonly & record {|
    string title;
    string artist;
|};

table<Album> key(title) albums = table [
    {title: "Blue Train", artist: "John Coltrane"},
    {title: "Jeru", artist: "Gerry Mulligan"}
];

service / on new http:Listener(9090) {

    resource function get albums() returns Album[] {
        return albums.toArray();
    }
}

[ballerina.http.accessLogConfig]
# Enable printing access logs on the Console. The default value is `false`.
console = true
# Specify the file path to save the access logs. This is optional.  
path = "testAccessLog.txt"
