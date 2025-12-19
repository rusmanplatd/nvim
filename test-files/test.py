"""Python Test File - Tests Pyright LSP and formatting"""

from typing import List, Optional
from dataclasses import dataclass
from datetime import datetime


@dataclass
class User:
    """Represents a user in the system."""

    id: int
    name: str
    email: str
    is_active: bool
    created_at: datetime


class UserService:
    """Service for managing users."""

    def __init__(self) -> None:
        self.users: List[User] = []

    def add_user(self, user: User) -> None:
        """Add a new user to the service."""
        self.users.append(user)

    def get_user_by_id(self, user_id: int) -> Optional[User]:
        """Retrieve a user by ID."""
        for user in self.users:
            if user.id == user_id:
                return user
        return None

    def get_active_users(self) -> List[User]:
        """Get all active users."""
        return [user for user in self.users if user.is_active]

    def get_all_users(self) -> List[User]:
        """Get all users."""
        return self.users


def main() -> None:
    """Main function to test the UserService."""
    service = UserService()

    # Add a user
    user = User(
        id=1,
        name="John Doe",
        email="john@example.com",
        is_active=True,
        created_at=datetime.now(),
    )
    service.add_user(user)

    # Get user by ID
    found_user = service.get_user_by_id(1)
    if found_user:
        print(f"Found user: {found_user.name} ({found_user.email})")

    # Get active users
    active_users = service.get_active_users()
    print(f"Active users: {len(active_users)}")


if __name__ == "__main__":
    main()
