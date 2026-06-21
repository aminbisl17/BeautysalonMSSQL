DECLARE @status BIT;
DECLARE @array detajet_termineve_array;

insert into @array(ID_sherbimit, id_atributit, kohezgjatja, pagesa)
values(1020, null, 150, 5),
(1019, null, 150, 10),
(1020, null, 150, 20);

EXEC create_appointment
    @IDClientit = 1037,
    @IDEmployee = 2014,
    @pershkrimi = 'Test 2',
    @data_caktimit = '2026-01-19 15:00:00',  
    @detajet_termineve = @array,
    @status = @status OUTPUT;

-- SELECT @status AS StatusResult, * from terminet;

-- select * from terminet;

