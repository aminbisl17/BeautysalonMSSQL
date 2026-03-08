alter table clients add email nvarchar(100) default null;
CREATE UNIQUE INDEX UQ_clients_email
ON clients(email)
WHERE email IS NOT NULL;
select * from clients;