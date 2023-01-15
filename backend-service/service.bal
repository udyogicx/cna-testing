import ballerina/http;
import ballerina/crypto;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}

service / on new http:Listener(9091) {

    resource function get md5sum(string value) returns string|error {
        byte[] hashedBytes = crypto:hashMd5(value.toBytes());
        return hashedBytes.toBalString();
    }
}
