INSERT INTO employeeAvailability
(
    id_employee,
    start_date,
    end_date
)
VALUES
(
    1015,
    '2026-08-15',
    '2026-08-31'
);

INSERT INTO availabilityDetails
(
    id_availability,
    day_of_week,
    start_time,
    end_time,
    pause_start,
    pause_end
)
VALUES
-- Monday 09:00 - 17:00, break 13:00-14:00
(1, 1, '09:00', '17:00', '13:00', '14:00'),

-- Tuesday 09:00 - 17:00, break 13:00-14:00
(1, 2, '09:00', '17:00', '13:00', '14:00'),

-- Wednesday 10:00 - 18:00, no break
(1, 3, '10:00', '18:00', NULL, NULL),

-- Thursday 09:00 - 17:00, break 12:30-13:30
(1, 4, '09:00', '17:00', '12:30', '13:30'),

-- Friday 09:00 - 15:00, no break
(1, 5, '09:00', '15:00', NULL, NULL);