DECLARE @days dbo.setDaysOfTheWeek;


INSERT INTO @days
(
    day_of_week,
    start_time,
    end_time,
    pause_start,
    pause_end
)
VALUES
-- Monday 09:00 - 17:00, break 13:00-14:00
(1, '09:00', '17:00', '13:00', '14:00'),

-- Tuesday 09:00 - 17:00, break 13:00-14:00
(2, '09:00', '17:00', '13:00', '14:00'),

-- Wednesday 10:00 - 18:00, no break
(3, '10:00', '18:00', NULL, NULL),

-- Thursday 09:00 - 17:00, break 12:30-13:30
(4, '09:00', '17:00', '12:30', '13:30'),

-- Friday 09:00 - 15:00, no break
(5, '09:00', '15:00', NULL, NULL);


EXEC setAvailableDates
    @id_employee = 1015,
    @start_date = '2026-09-15',
    @end_date = '2026-09-30',
    @daysOfTheWeek = @days;