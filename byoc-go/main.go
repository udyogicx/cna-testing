package main

import (
	"fmt"
	"net/http"
)

func main() {

	// Greeting godoc
	// @Summary Greet a person
	// @Description Greet a person by name
	// @Tags greeting

	// @Produce text/plain
	// @Param name path string true "Name of the person to greet"
	// @Router /hello&name={name} [get]
	http.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		name := r.URL.Query().Get("name")
		if name == "" {
			name = "World"
		}
		fmt.Fprintf(w, "Hello, %s!", name)
	})

	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		panic(err)
	}
}
