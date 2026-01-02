

USE master

go
 IF EXISTS (SELECT name FROM master.sys.server_principals WHERE name = N'beautysalon_login')

 begin

 DROP LOGIN beautysalon_login;

 end

 CREATE LOGIN beautysalon_login WITH PASSWORD = 'beautysalon11112222', DEFAULT_DATABASE = beautysalon; 
 go

 USE beautysalon

 go

 DROP USER IF EXISTS beautysalon_user;
 CREATE USER beautysalon_user FOR LOGIN beautysalon_login;

 GRANT SELECT, INSERT, UPDATE, DELETE ON users to beautysalon_user;
 GRANT SELECT, INSERT, UPDATE, DELETE ON clients to beautysalon_user;
 GRANT SELECT, INSERT, DELETE ON historiku to beautysalon_user;
 GRANT SELECT, INSERT, UPDATE, DELETE ON employees to beautysalon_user;
 GRANT SELECT, INSERT, UPDATE, DELETE ON sherbimet to beautysalon_user;
 GRANT SELECT, INSERT, UPDATE, DELETE ON atributet_sherbimeve to beautysalon_user;
 GRANT SELECT, INSERT, UPDATE, DELETE ON terminet to beautysalon_user;
 go
