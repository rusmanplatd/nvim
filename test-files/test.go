package main

import (
	"fmt"
	"time"
)

// User represents a user in the system
type User struct {
	ID        int
	Name      string
	Email     string
	CreatedAt time.Time
}

// UserService handles user operations
type UserService struct {
	users []User
}

// NewUserService creates a new UserService
func NewUserService() *UserService {
	return &UserService{
		users: make([]User, 0),
	}
}

// AddUser adds a new user to the service
func (s *UserService) AddUser(user User) {
	s.users = append(s.users, user)
}

// GetUserByID retrieves a user by ID
func (s *UserService) GetUserByID(id int) (*User, error) {
	for _, user := range s.users {
		if user.ID == id {
			return &user, nil
		}
	}
	return nil, fmt.Errorf("user with ID %d not found", id)
}

// GetAllUsers returns all users
func (s *UserService) GetAllUsers() []User {
	return s.users
}

func main() {
	service := NewUserService()

	// Add a user
	service.AddUser(User{
		ID:        1,
		Name:      "John Doe",
		Email:     "john@example.com",
		CreatedAt: time.Now(),
	})

	// Get user by ID
	user, err := service.GetUserByID(1)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	fmt.Printf("Found user: %s (%s)\n", user.Name, user.Email)

	// Get all users
	allUsers := service.GetAllUsers()
	fmt.Printf("Total users: %d\n", len(allUsers))
}
