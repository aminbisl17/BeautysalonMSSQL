
CREATE PROCEDURE AddAttendance
    @ID_Employee INT,
    @started_at TIME,
    @date DATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;


        -- Check if employee is available on this date
        IF NOT EXISTS
        (
            SELECT 1
            FROM employeeAvailability ea
            INNER JOIN availabilityDetails ad
                ON ea.id_availability = ad.id_availability
            WHERE ea.id_employee = @ID_Employee
            AND @date BETWEEN ea.start_date AND ea.end_date
            AND ad.day_of_week = DATEPART(WEEKDAY, @date)
            AND @started_at BETWEEN ad.start_time AND ad.end_time
        )
        BEGIN
            THROW 50001, 'Employee is not available on this date or time.', 1;
        END;


        -- Insert attendance
        INSERT INTO attendance
        (
            ID_Employee,
            started_at,
            date
        )
        VALUES
        (
            @ID_Employee,
            @started_at,
            @date
        );


        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;

    END CATCH
END;
GO