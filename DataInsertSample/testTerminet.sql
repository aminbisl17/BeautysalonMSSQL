DECLARE @status BIT;

EXEC create_appointment
    @IDClientit = 16,
    @IDEmployee = 10,
    @pershkrimi = 'Test Appointment',
    @data_caktimit = '2026-01-19 14:30:00',  -- Same minute as existing appointment
    @ID_sherbimit = 4,
    @id_atributit = NULL,
    @kohezgjatja = '01:00:00',
    @pagesa = 50,
    @status = @status OUTPUT;

SELECT @status AS StatusResult, * from terminet;

