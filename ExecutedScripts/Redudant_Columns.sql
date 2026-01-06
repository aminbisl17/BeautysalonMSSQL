alter table users drop constraint DF__users__gjinia__7E37BEF6;
alter table users drop constraint DF__users__numri_tel__7F2BE32F;
alter table users drop constraint DF__users__pershkrim__7C4F7684;
alter table users drop constraint DF__users__gjinia__7E37BEF6;

alter table users drop column isAdmin,isActive, gjinia, numri_telefonit, pershkrimi;

select * from users;