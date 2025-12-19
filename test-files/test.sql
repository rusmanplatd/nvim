-- PostgreSQL example queries
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO users (username, email) 
VALUES 
    ('john_doe', 'john@example.com'),
    ('jane_smith', 'jane@example.com');

-- Select query
SELECT 
    u.id,
    u.username,
    u.email,
    u.created_at
FROM users u
WHERE u.created_at > NOW() - INTERVAL '7 days'
ORDER BY u.created_at DESC;

-- Update query
UPDATE users 
SET email = 'newemail@example.com'
WHERE username = 'john_doe';

-- Delete query
DELETE FROM users 
WHERE created_at < NOW() - INTERVAL '1 year';
