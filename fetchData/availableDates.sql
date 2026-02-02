DECLARE @StartDate DATE = DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1);
DECLARE @EndDate DATE = EOMONTH(GETDATE());

-- Step 1: Generate all dates of the month excluding Sundays
WITH AllDates AS (
    SELECT @StartDate AS TheDate
    UNION ALL
    SELECT DATEADD(DAY, 1, TheDate)
    FROM AllDates
    WHERE DATEADD(DAY, 1, TheDate) <= @EndDate
),
-- Step 2: Generate all time slots from 7:00 to 17:00 (5 PM) for each date
TimeSlots AS (
    SELECT 
        d.TheDate,
        DATEADD(HOUR, v.Number + 7, CAST(d.TheDate AS DATETIME2)) AS SlotTime
    FROM AllDates d
    CROSS APPLY (
        SELECT 0 AS Number UNION ALL
        SELECT 1 UNION ALL
        SELECT 2 UNION ALL
        SELECT 3 UNION ALL
        SELECT 4 UNION ALL
        SELECT 5 UNION ALL
        SELECT 6 UNION ALL
        SELECT 7 UNION ALL
        SELECT 8 UNION ALL
        SELECT 9 UNION ALL
        SELECT 10
    ) v
    WHERE DATEPART(WEEKDAY, d.TheDate) <> 1  -- Exclude Sundays
)
-- Step 3: Exclude slots already booked in terminet
SELECT ts.SlotTime
FROM TimeSlots ts
LEFT JOIN terminet t
    ON t.data_caktimit = ts.SlotTime
WHERE t.ID IS NULL
ORDER BY ts.SlotTime
OPTION (MAXRECURSION 0);