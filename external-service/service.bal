import ballerina/http;

configurable string endpointUrl = ?;

http:Client clientEP = check new (endpointUrl);
# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get proxy(string name) returns json|error {
        json payload = check clientEP->get(string `${endpointUrl}/greeting?name=${name}`);
        return payload;
    }
}
