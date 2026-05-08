

alter table sherbimet drop constraint DF__sherbimet__kohez__72C60C4A;
alter table sherbimet alter column kohezgjatja int;
select * from sherbimet;