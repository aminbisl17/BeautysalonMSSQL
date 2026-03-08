

create type dbo.detajet_termineve_array as table
(
 ID_sherbimit bigint not null,
 id_atributit bigint default null,
 kohezgjatja TIME default '00:00:00',
 pagesa decimal(10,2) default 0
);