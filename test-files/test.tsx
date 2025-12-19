// TypeScript Test File
// This file tests TypeScript LSP, formatting, and completion

interface User {
  id: number;
  name: string;
  email: string;
  isActive: boolean;
}

class UserService {
  private users: User[] = [];

  addUser(user: User): void {
    this.users.push(user);
  }

  getUserById(id: number): User | undefined {
    return this.users.find((user) => user.id === id);
  }

  getActiveUsers(): User[] {
    return this.users.filter((user) => user.isActive);
  }
}

// Test the service
const service = new UserService();

service.addUser({
  id: 1,
  name: "John Doe",
  email: "john@example.com",
  isActive: true,
});

const user = service.getUserById(1);
console.log(user);

// React Component Example
import React from "react";

interface Props {
  title: string;
  count: number;
}

const Counter: React.FC<Props> = ({ title, count }) => {
  const [value, setValue] = React.useState(count);

  return (
    <div>
      <h1>{title}</h1>
      <p>Count: {value}</p>
      <button onClick={() => setValue(value + 1)}>Increment</button>
    </div>
  );
};

export default Counter;
