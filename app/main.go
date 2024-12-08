package main

import (
	"fmt"
	"net/http"
	"time"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	t := time.Now()
	fmt.Fprintf(w, "Hello from docker!\nIt's %s", t)
}

func main() {
	http.HandleFunc("/api/hello", helloHandler)
	err := http.ListenAndServe(":8080", nil)
	fmt.Println(err)
}
