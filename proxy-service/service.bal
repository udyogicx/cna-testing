import ballerina/http;

configurable string endpointUrl = ?;

http:Client clientEP = check new (endpointUrl);
# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function 'default [string path](http:Request req) returns json|error {
        json payload = check clientEP->forward(path, req);
        return payload;
    }
}
