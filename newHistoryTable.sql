

use beautysalon;

CREATE TABLE historiku_detajet(
   id_historikut_detajet bigint identity(1,1) primary key,
   id_historikut int not null,
   emri_sherbimit nvarchar(100),
   emri_atributit nvarchar(150),
   pershkrimi nvarchar(150),
   pagesa decimal(10,2),
   constraint fk_id_historikut foreign key (id_historikut) references historiku(id_historikut) on delete cascade
);

alter table historiku drop column pagesa, qmimiBazik, zbritja, pershkrimi, kohezgjatja, emri_sherbimit, emri_atributit;
select * from historiku;

alter table historiku drop constraint fk_ID;
alter table historiku drop constraint fk_id_employee;

alter table historiku add constraint fk_ID foreign key (ID) references clients(ID) on delete cascade;
alter table historiku add constraint fk_id_employee foreign key (id_employee) references employees(ID) on delete set null;



alter table historiku drop column data_sherbimit;
alter table historiku add data_sherbimit DATETIME2 default GETDATE();


create type historiku_detajet_array as table (
    emri_sherbimit nvarchar(100),
    emri_atributit nvarchar(100),
    pershkrimi nvarchar(100),
    pagesa decimal(10,2)
);


create procedure register_history 

@ID int,
@id_employee int,
@historiku_detajet dbo.historiku_detajet_array READONLY
as 
begin
SET NOCOUNT ON;

    BEGIN TRANSACTION;


declare @newID int;

insert into historiku(ID, id_employee)
 values(@ID, @id_employee);

 set @newID = SCOPE_IDENTITY();

 insert into historiku_detajet(id_historikut, emri_sherbimit, emri_atributit, pershkrimi, pagesa)
 SELECT @newID, emri_sherbimit, emri_atributit, pershkrimi, pagesa from @historiku_detajet;
  commit transaction;
 end;
