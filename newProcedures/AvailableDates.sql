

CREATE PROCEDURE setAvailableDates
    @id_employee INT,
    @start_date DATE,
    @end_date DATE,
    @daysOfTheWeek dbo.setDaysOfTheWeek READONLY
AS
BEGIN
    SET NOCOUNT ON;

    IF @end_date < @start_date
    BEGIN
        THROW 50002, 'End date cannot be before start date.', 1;
    END;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check for overlapping availability
IF EXISTS
(
    SELECT 1
    FROM employeeAvailability
    WHERE id_employee = @id_employee
    AND
    (
        @start_date <= end_date
        AND
        @end_date >= start_date
    )
)
        BEGIN
            THROW 50001, 'Employee already has availability in this date range.', 1;
        END;


        DECLARE @id_availability BIGINT;


        INSERT INTO employeeAvailability
        (
            id_employee,
            start_date,
            end_date
        )
        VALUES
        (
            @id_employee,
            @start_date,
            @end_date
        );


        SET @id_availability = SCOPE_IDENTITY();


        INSERT INTO availabilityDetails
        (
            id_availability,
            day_of_week,
            start_time,
            end_time,
            pause_start,
            pause_end
        )
        SELECT
            @id_availability,
            day_of_week,
            start_time,
            end_time,
            pause_start,
            pause_end
        FROM @daysOfTheWeek;


        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;

    END CATCH
END;
GO