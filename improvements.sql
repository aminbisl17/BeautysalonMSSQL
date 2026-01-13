

use beautysalon;

alter table historiku add id_employee int;

alter table historiku add constraint fk_id_employee foreign key (id_employee) references employees(ID);