import ballerina/http;

configurable string endpointUrl = ?;
configurable string hashEpUrl = ?;

http:Client clientEP = check new (endpointUrl);
http:Client md5Ep = check new (hashEpUrl);
# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get proxy(string name) returns string|error {
        string payload = check clientEP->get(string `/greeting?name=${name}`);
        return payload;
    }


    resource function get md5sum(string value) returns string|error {
        string payload = check md5Ep->get(string `/md5sum?value=${value}`);
        return payload;
    }
}
