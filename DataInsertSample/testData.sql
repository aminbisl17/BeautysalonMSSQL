


/*
declare @array historiku_detajet_array

insert into @array(emri_sherbimit, emri_atributit, pershkrimi, pagesa)
values(null, null, null, null),
(null, null, null, null),
(null, null, null, null);

EXECUTE register_history @ID = 8, @id_employee = 1, @historiku_detajet = @array;
 */
--select h.*, d.* from historiku h join historiku_detajet d on h.id_historikut = h.id_historikut;
--select * from historiku;

--delete from historiku;


alter table terminet add [status] nvarchar(15)
CONSTRAINT CHK_status_values CHECK ([status] IN ('pending','overdue', 'executing'))  
CONSTRAINT DF_status DEFAULT 'pending';