package main

// Usage:
// $ go run helloserver.go
// $ curl http://localhost:8080/foo/

import (
    "fmt"
    "net/http"
)

func fooHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprint(w, "Hello, world!")
}

func main() {
	http.HandleFunc("/foo/", fooHandler)
	http.ListenAndServe(":8080", nil)
}
