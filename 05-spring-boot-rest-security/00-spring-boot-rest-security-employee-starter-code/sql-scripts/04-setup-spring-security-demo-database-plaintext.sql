USE employee_directory;

-- Drop tables if they exist
IF OBJECT_ID('authorities', 'U') IS NOT NULL
    DROP TABLE authorities;

IF OBJECT_ID('users', 'U') IS NOT NULL
    DROP TABLE users;

-- Table structure for table `users`
CREATE TABLE users (
  username NVARCHAR(50) NOT NULL,
  password NVARCHAR(50) NOT NULL,
  enabled BIT NOT NULL,
  CONSTRAINT PK_users PRIMARY KEY (username)
);

-- Inserting data for table `users`
INSERT INTO users (username, password, enabled)
VALUES 
('john', '{noop}test123', 1),
('mary', '{noop}test123', 1),
('susan', '{noop}test123', 1);

-- Table structure for table `authorities`
CREATE TABLE authorities (
  username NVARCHAR(50) NOT NULL,
  authority NVARCHAR(50) NOT NULL,
  CONSTRAINT UK_authorities UNIQUE (username, authority),
  CONSTRAINT FK_authorities_users FOREIGN KEY (username) REFERENCES users (username)
);

-- Inserting data for table `authorities`
INSERT INTO authorities (username, authority)
VALUES 
('john', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_MANAGER'),
('susan', 'ROLE_EMPLOYEE'),
('susan', 'ROLE_MANAGER'),
('susan', 'ROLE_ADMIN');
