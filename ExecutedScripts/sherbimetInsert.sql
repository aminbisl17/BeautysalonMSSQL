

DECLARE @ID int;

insert into sherbimet(emri_sherbimit, pershkrimi, qmimi_baze, zbritja, kohezgjatja)
values('ssds', 'pershkrim', 20.0, 2, '00:30:33');

set @ID = SCOPE_IDENTITY();

INSERT INTO atributet_sherbimeve(ID, opsioni, pershkrimi_opsionit, kohezgjatja, qmimi, zbritja)
values(@ID, 'sdds', 'ps','00:30:00', 23, 1);

select * from atributet_sherbimeve;