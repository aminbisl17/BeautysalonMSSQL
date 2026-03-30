
Create table attendance (
 ID bigint primary key identity(1,1) not null,
 ID_Employee int not null,
 started_at DATETIME2 DEFAULT SYSDATETIME(),
 ended_at DATETIME2 default null,
  constraint attendance_id_employee foreign key(ID_Employee) REFERENCES employees(ID)
 );

 

CREATE TABLE qr_session (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    code VARCHAR(255),
    expires_at DATETIME2
);

GRANT DELETE, INSERT, SELECT ON qr_session TO beautysalon_user;

GRANT DELETE, INSERT, SELECT ON attendance TO beautysalon_user;