-- Kiểm tra và xóa người dùng nếu tồn tại
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'springstudent')
BEGIN
    DROP USER springstudent;
END

-- Kiểm tra và xóa login nếu tồn tại
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'springstudent')
BEGIN
    DROP LOGIN springstudent;
END

-- Tạo login mới
CREATE LOGIN springstudent WITH PASSWORD = 'springstudent';

-- Tạo người dùng mới trong cơ sở dữ liệu hiện tại và ánh xạ đến login
CREATE USER springstudent FOR LOGIN springstudent;

-- Cấp quyền cho người dùng
ALTER ROLE db_owner ADD MEMBER springstudent;
