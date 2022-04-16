package rooms

import (
	"errors"
	"fmt"

	"golang.org/x/crypto/bcrypt"
)

type Room struct {
	Id          uint32 `json:"id"`
	Title       string `json:"title"`
	Description string `json:"description"`
	AuthorId    int    `json:"authorId"`
	IsPrivate   bool   `json:"isPrivate"`
	Password    string `json:"password"`
}

var rooms []*Room = make([]*Room, 0, 10)

const SALT = "z43098m,x66#c894cx"

func getCurrentId() uint32 {
	return uint32(len(rooms))
}

func hashPassword(password string) string {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password+SALT), bcrypt.DefaultCost)
	if err != nil {
		fmt.Println(err)
	}
	return string(hashedPassword)
}

func NewRoom(title string, description string, authorId int, isPrivate bool, password string) *Room {
	return &Room{
		Id:          getCurrentId(),
		Title:       title,
		Description: description,
		AuthorId:    authorId,
		IsPrivate:   isPrivate,
		Password:    hashPassword(password),
	}
}

func Add(room *Room) {
	rooms = append(rooms, room)
}

func GetList(skip uint, limit uint) []*Room {
	var start, end int
	start = int(skip)
	end = int(skip + limit)
	if start > len(rooms) {
		start = len(rooms)
	}
	if end > len(rooms) {
		end = len(rooms)
	}
	return rooms[start:end]
}

func Get(id uint32) (*Room, error) {
	for i := 0; i < len(rooms); i++ {
		if rooms[i].Id == id {
			return rooms[i], nil
		}
	}
	return nil, errors.New("no a room with this id")
}

func Remove(id uint32) error {
	for i := 0; i < len(rooms); i++ {
		if rooms[i].Id == id {
			rooms = append(rooms[:i], rooms[i+1:]...)
			return nil
		}
	}
	return errors.New("no such room")
}

func (r *Room) Update(title string, description string) {
	r.Title = title
	r.Description = description
}

func (r *Room) UpdatePassword(password string) {
	if len(password) > 0 {
		r.Password = hashPassword(password)
		r.IsPrivate = true
	} else {
		r.Password = ""
		r.IsPrivate = false
	}
}

func (r *Room) LogIn(password string) bool {
	var passwordHash string = hashPassword(password)
	return passwordHash == r.Password
}
