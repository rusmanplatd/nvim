use std::collections::HashMap;

/// Represents a user in the system
#[derive(Debug, Clone)]
pub struct User {
    pub id: u32,
    pub name: String,
    pub email: String,
    pub is_active: bool,
}

/// Service for managing users
pub struct UserService {
    users: HashMap<u32, User>,
}

impl UserService {
    /// Creates a new UserService
    pub fn new() -> Self {
        Self {
            users: HashMap::new(),
        }
    }

    /// Adds a new user to the service
    pub fn add_user(&mut self, user: User) {
        self.users.insert(user.id, user);
    }

    /// Retrieves a user by ID
    pub fn get_user_by_id(&self, id: u32) -> Option<&User> {
        self.users.get(&id)
    }

    /// Gets all active users
    pub fn get_active_users(&self) -> Vec<&User> {
        self.users
            .values()
            .filter(|user| user.is_active)
            .collect()
    }

    /// Gets all users
    pub fn get_all_users(&self) -> Vec<&User> {
        self.users.values().collect()
    }
}

impl Default for UserService {
    fn default() -> Self {
        Self::new()
    }
}

fn main() {
    let mut service = UserService::new();

    // Add a user
    let user = User {
        id: 1,
        name: String::from("John Doe"),
        email: String::from("john@example.com"),
        is_active: true,
    };
    service.add_user(user);

    // Get user by ID
    if let Some(user) = service.get_user_by_id(1) {
        println!("Found user: {} ({})", user.name, user.email);
    }

    // Get active users
    let active_users = service.get_active_users();
    println!("Active users: {}", active_users.len());
}
