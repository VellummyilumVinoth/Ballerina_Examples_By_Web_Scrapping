import ballerina/io;

// You can have Unicode identifiers.
function à¸à¸´à¸¡à¸à¹à¸à¸·à¹à¸­(string à¸à¸·à¹à¸­) {
    // Use \u{H} to specify character using Unicode code point in hex.
   io:println(à¸à¸·à¹\u{E2D});
}

// Prefix reserved keywords with a single quote.
string 'from = "contact@ballerina.io";

// Prefix non-identifier character with a \\.
string first\ name = "Ballerina";

public function main() {
    à¸à¸´à¸¡à¸à¹à¸à¸·à¹à¸­("à¶à¶ºà·à¶¶à·à·à¶±à·");
}