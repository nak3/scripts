package main

import (
    "log"
    "net/http" // http://golang.org/pkg/net/http/
)

func main() {
    http.Handle("/", http.StripPrefix("/", http.FileServer(http.Dir("."))))
    if err := http.ListenAndServe(":8080", nil); err != nil {
        log.Fatal("ListenAndServe: ", err)
    }
}
