package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"

	"flutter_chat.com/server/rooms"
)

const PAGE_AMOUNT = 10

func main() {
	http.HandleFunc("/rooms", RoomHandler)
	http.ListenAndServe("0.0.0.0:8080", nil)
}

func RoomHandler(w http.ResponseWriter, r *http.Request) {
	// if r.URL.Path != "/rooms" {
	// 	http.Error(w, "404 not found.", http.StatusNotFound)
	// 	return
	// }

	switch r.Method {
	case "GET":
		pageString := r.URL.Query().Get("page")
		page, err := strconv.Atoi(pageString)
		if err != nil {
			page = 1
		}
		if page < 1 {
			page = 1
		}
		var roomList []*rooms.Room = rooms.GetList(uint((page-1)*PAGE_AMOUNT), PAGE_AMOUNT)

		roomListString, _ := json.Marshal(roomList)
		fmt.Fprintf(w, string(roomListString))

	case "POST":
		title := r.FormValue("title")
		description := r.FormValue("description")
		isPrivateString := r.FormValue("isPrivate")
		password := r.FormValue("password")
		isPrivateInt, err := strconv.Atoi(isPrivateString)
		if err != nil {
			fmt.Println(err)
		}
		isPrivate := isPrivateInt == 0
		authorId := 1
		var newRoom *rooms.Room = rooms.NewRoom(
			title,
			description,
			authorId,
			isPrivate,
			password,
		)

		// fmt.Printf("title: %s", title)
		// fmt.Printf("description: %s", description)
		// fmt.Printf("isPrivate: %s", isPrivate)

		rooms.Add(newRoom)

		fmt.Fprintf(w, "ok")
	case "PUT":
		roomIdString := r.FormValue("id")
		roomId, _ := strconv.Atoi(roomIdString)
		title := r.FormValue("title")
		description := r.FormValue("description")
		password := r.FormValue("password")

		// ADD CHECKING AUTHOR!!!

		// fmt.Printf("roomId: %s\n", roomId)
		// fmt.Printf("title %s\n", title)
		// fmt.Printf("description %s\n", description)
		// fmt.Printf("password %s\n", password)

		room, err := rooms.Get(uint32(roomId))
		if err != nil {
			fmt.Println(err)
		}

		if password != "" {
			room.UpdatePassword(password)
		} else {
			room.Update(title, description)
		}

		fmt.Fprintf(w, "ok")
	case "DELETE":
		// ADD CHECKING AUTHOR!!!

		roomIdString := r.FormValue("id")
		roomId, _ := strconv.Atoi(roomIdString)
		rooms.Remove(uint32(roomId))
		fmt.Fprint(w, "ok")
	default:
		fmt.Fprint(w, "something else")
	}

}
