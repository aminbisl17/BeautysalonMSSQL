create table employeeAvailability(
   id_availability bigint primary key identity(1,1),
   id_employee int not null,
   start_date date not null,
   end_date date not null,
   foreign key (id_employee) references employees(ID)
     ON DELETE CASCADE
     );

   CREATE TABLE availabilityDetails(
    id_availability_details BIGINT PRIMARY KEY IDENTITY(1,1),
    id_availability BIGINT NOT NULL,
    day_of_week INT NOT NULL, -- 1 Monday, 7 Sunday
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    pause_start TIME default null,
    pause_end TIME default null,
    FOREIGN KEY (id_availability) 
        REFERENCES employeeAvailability(id_availability) ON DELETE CASCADE
);