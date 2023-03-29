package main

import (
	"fmt"
	"net/http"
)

func main() {
	serverMux := http.NewServeMux();
	serverMux.HandleFunc("/greeter/greet", greet)

	err := http.ListenAndServe(":9090", serverMux)
	if err != nil {
		panic(err)
	}
}

func greet(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	if name == "" {
		name = "Stranger"
	}
	fmt.Fprintf(w, "Hello, %s!\n", name)
}
