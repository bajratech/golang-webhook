package main
import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Server Started.")
	router := NewRouter()
	log.Fatal(http.ListenAndServe(":30611", router))
}
