import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service /greeting on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get hello(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}

# A service representing a network-accessible API
# bound to port `8080`.
service /greeting8080 on new http:Listener(8080) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get hello(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello 8080, " + name;
    }
}


# A service representing a network-accessible API
# bound to port `6657`.
service /greeting6657 on new http:Listener(6657) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get hello(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello 6657, " + name;
    }
}
