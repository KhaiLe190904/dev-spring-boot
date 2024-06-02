USE employee_directory;

-- Drop tables if they exist
IF OBJECT_ID('dbo.roles', 'U') IS NOT NULL
    DROP TABLE dbo.roles;

IF OBJECT_ID('dbo.members', 'U') IS NOT NULL
    DROP TABLE dbo.members;

-- Table structure for table `members`
CREATE TABLE dbo.members (
  user_id NVARCHAR(50) NOT NULL,
  pw CHAR(68) NOT NULL,
  active BIT NOT NULL,
  CONSTRAINT PK_members PRIMARY KEY (user_id)
);

-- Inserting data for table `members`
-- NOTE: The passwords are encrypted using BCrypt
-- Default passwords here are: fun123

INSERT INTO dbo.members (user_id, pw, active)
VALUES
('john', '{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q', 1),
('mary', '{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q', 1),
('susan', '{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q', 1);

-- Table structure for table `roles`
CREATE TABLE dbo.roles (
  user_id NVARCHAR(50) NOT NULL,
  role NVARCHAR(50) NOT NULL,
  CONSTRAINT UK_roles UNIQUE (user_id, role),
  CONSTRAINT FK_roles_members FOREIGN KEY (user_id) REFERENCES dbo.members (user_id)
);

-- Inserting data for table `roles`
INSERT INTO dbo.roles (user_id, role)
VALUES
('john', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_MANAGER'),
('susan', 'ROLE_EMPLOYEE'),
('susan', 'ROLE_MANAGER'),
('susan', 'ROLE_ADMIN');
