DECLARE @status BIT;
DECLARE @array detajet_termineve_array;

insert into @array(ID_sherbimit, id_atributit, kohezgjatja, pagesa)
values(4, null, '', 5),
(7, null, '', 10),
(8, null, '', 20);

EXEC create_appointment
    @IDClientit = 16,
    @IDEmployee = 10,
    @pershkrimi = 'Test Appointment',
    @data_caktimit = '2026-01-19 14:30:00',  -- Same minute as existing appointment
    @detajet_termineve = @array,
    @status = @status OUTPUT;

SELECT @status AS StatusResult, * from terminet;

