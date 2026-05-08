
delete from sherbimet;

ALTER TABLE sherbimet
add is_active BIT NOT NULL DEFAULT 1;
select * from sherbimet;