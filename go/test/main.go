package main 

import (
    "fmt"
    "os"
    "net/http"
)

func main () { 
    fmt.Println ("Starting test server...");

    var PORT string
    PORT = os.Getenv("PORT")

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello %s from path: %s\n", r.UserAgent(), r.URL.Path)
    })
    http.ListenAndServe(":" + PORT, nil)
}
